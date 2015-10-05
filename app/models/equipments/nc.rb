# encoding: utf-8

module Equipments
  module Nc
    class Nc1
      # 条件
      # condition = {
      #     1 + 2 => 00 || 01 || 11, # 00 不用给9 发信号， 如果 01 表示零件已经加工好，等待开门信号，机械手工作，然后给再发送1-0，松开夹具， 然后检测4地址是否为1，  如果是然后再叫机器人可以动作
      #     #  如果是11， 打开门(检测门的状态（地址为5，1为已打开，0未完全打开)（就给地址7发送启动信号)，机械手送货， 待上料夹具加紧，如果给M-FIM发1－0信号， 则加紧，然后检测地址3，如果为1，则机械手走人， 如果走好，则关门，是否关好门（地址为6［如果值为1], 设定代码号，判断代码号（地址为36）是否正确， 然后M-FIM信号，
      #
      #     43 => 1 || 0# 数据是否有效 1 为 无效， 0为有效
      # }
      READ_NC_NO_ADD = 0 # 为IP地址
      READ_FIRST_STATE_ADD = 1
      READ_SECOND_STATE_ADD = 2
      READ_VALIDATE_ADD  = 43 # 1 = invalid, 0 = valid
      WRITE_RUNNING_ADD = 9 #1 为运行(读到是1，马上写0) M-FIM 信号

      attr_accessor :no, :valid_code, :run, :state_1, :state_2, :action, :door, :button, :jig, :robot

      # Usage:
      # Equipments::Nc::Nc1.build(action: 'in')
      # Equipments::Nc::Nc1.build(action: 'out')
      
      def self.build(values = {})
        self.new(values)
      end

      def initialize(values = {})
        sync(values)
      end

      def sync(values)
        @action = values[:action]
        begin
          ModBus::TCPClient.new(Settings.nc.nc1.ip, 502) do |cl|
            cl.with_slave(1) do |slave|
              @no, @state_1, @state_2 = slave.holding_registers[READ_NC_NO_ADD..READ_SECOND_STATE_ADD]
              @valid_code = slave.holding_registers[READ_VALIDATE_ADD]
            end
          end
          @door = Equipments::Nc::Door.build
          @jig = Equipments::Nc::Jig.build
          @robot =  Equipments::Nc::robot.build
        rescue ModBus::Errors::ModBusTimeout => e
          Rails.logger.info("*"*100)
          Rails.logger.info("IP地址是不是设置错了啊, Modbus无法连接!!!")
          Rails.logger.info("*"*100)
        end
        self
      end


      # 00
      # 正在执行
      def busy?
        @state_1 == 0 && self.state_2 == 0
      end

      # 11
      # 如果是上料，等待夹具夹紧
      # 夹具是否可以松开, 如果可以，给M-FIN发信号
      def jig_can_close?
        self.state_1 == 1 && self.state_2 == 1
      end

      # 01
      # 夹具是否可以松开, 如果可以，给M-FIN发信号
      def jig_can_open?
        self.state_1 == 0 && self.state_2 == 1
      end

      alias_method :door_can_close?, :jig_can_close?
      alias_method :door_can_open?, :jig_can_open?

      # 10
      # 等待加工, 可以发M-FIN信号执行
      def can_start?
        self.state_1 == 1 && self.state_2 == 0 && self.valid_code == 0
      end

      def out?
       self.action == 'out'
      end

      def in?
        self.action == 'in'
      end
    end

    class Button
      WRITE_START_ADD = 7  # 控制启动按钮, 写1 读到是1，马上写0
      WRITE_CANCEL_ADD = 8  # 1急停 0是取消急停（需要人工复位)
      WRITE_OPEN_DOOR_ADD = 10  # 1 开门， 0 关门
      attr_accessor :start_state, :cancel_state

      def self.build
       self.new
      end

      def do_start(nc)
        if nc.can_start?
          Modbus.write(Settings.nc.nc1.ip, WRITE_START_ADD, 1)
          Modbus.write(Settings.nc.nc1.ip, WRITE_START_ADD, 0)
        end
      end

      alias_method :switch, :do_start

      def do_cancel(nc)
        @cancel_state = 1 # TODO: write address 8
      end

      def open_door(nc)
        if nc.door_can_open?
          Modbus.write(Settings.nc.nc1.ip, WRITE_OPEN_DOOR_ADD, 1)
        end
      end

      def close_door(nc)
        if nc.door_can_close?
          Modbus.write(Settings.nc.nc1.ip, WRITE_OPEN_DOOR_ADD, 0)
        end
      end
    end

    class Jig # 夹具
      READ_CLOSED_ADD = 3 # 夹具是否已经加紧
      READ_OPENED_ADD = 4 # 夹具是否已经加紧
      WRITE_OPENED_ADD = 9 # M-FIN
      attr_accessor :opened_state, :closed_state

      def self.build
        self.new
      end

      def initialize
        sync
      end

      def sync
        begin
          ModBus::TCPClient.new(Settings.nc.nc1.ip, 502) do |cl|
            cl.with_slave(1) do |slave|
              @jig_closed_status, @jig_opened_status= slave.holding_registers[READ_CLOSED_ADD..READ_OPENED_ADD]
            end
          end
        rescue ModBus::Errors::ModBusTimeout => e
          Rails.logger.info("*"*100)
          Rails.logger.info("IP地址是不是设置错了啊, Modbus无法连接!!!")
          Rails.logger.info("*"*100)
        end
        self
      end

      def do_open(nc, button)
        if nc.jig_can_open?
          button.switch(nc)
          self.opened_state = 1 # TODO: 生产环境删除，主要为了测试
        end
      end

      def do_close(nc, button)
        if nc.jig_can_close?
          button.switch(nc)
          self.closed_state = 1 # TODO: 生产环境删除，主要为了测试
        end
      end

      def opened?
       self.opened_state == 1
      end

      def closed?
        self.opened_state == 1
      end
    end

    class Door < Nc1# 门
      READ_OPENED_ADD = 5 # 0,1
      READ_CLOSED_ADD = 6 # 0,1
      attr_accessor :opened_state, :closed_state

      def self.build
        self.new
      end

      def initialize
        sync
      end

      def sync
        begin
          ModBus::TCPClient.new(Settings.nc.nc1.ip, 502) do |cl|
            cl.with_slave(1) do |slave|
              @door_opened_status, @door_closed_status = slave.holding_registers[READ_OPENED_ADD..READ_CLOSED_ADD]
            end
          end
        rescue ModBus::Errors::ModBusTimeout => e
          Rails.logger.info("*"*100)
          Rails.logger.info("IP地址是不是设置错了啊, Modbus无法连接!!!")
          Rails.logger.info("*"*100)
        end
        self
      end

      def do_open(nc, button)
        button.open_door(nc)
      end

      def do_close(nc, button)
        button.close_door(nc)
      end

      def opened?
        self.opened_state == 1
      end

      def closed?
        self.opened_state == 1
      end
    end

    class Program < Nc1
      WRITE_NO_ADD = 14 # 切换程序 6000-6020
      attr_accessor :no
    end

    class Robot

      def self.build
        self.new 
      end

      def initialize
       sync 
      end

      def sync
        
      end

      def do_go
        
      end

      def do_leave

      end

      def leaved?
        true
      end

      def arrived?
        true
      end
    end

  end
end

agv_arrived = true
if agv_arrived
  nc = Equipments::Nc::Nc1.build(action: 'in')
  button =  Equipments::Nc::Button.build
  door =  Equipments::Nc::Door.build
  jig =  Equipments::Nc::Jig.build
  robot =  Equipments::Nc::Robot.build
  button.open_door(nc)
  button.switch(nc)

  if door.opened?
    robot.do_go
  end

  if robot.arrived?

  end
end
