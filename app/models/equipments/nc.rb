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
      READ_VALIDATE_ADD  = 43 # 1 = invalid, 0 = valid
      READ_FIRST_STATE_ADD = 1
      READ_SECOND_STATE_ADD = 2
      WRITE_RUNNING_ADD = 9 #1 为运行(读到是1，马上写0) M-FIM 信号

      attr_accessor :no, :valid_code, :run, :state_1, :state_2, :action

      def initialize(values = {})
        @state_1 = values[:state_1]
        @state_2 = values[:state_2]
        @action = values[:action]
        @valid_code = values[:valid_code]
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

    class Button < Nc1
      WRITE_START_ADD = 7  # 控制启动按钮, 写1 读到是1，马上写0
      WRITE_CANCEL_ADD = 8  # 1急停 0是取消急停（需要人工复位)
      attr_accessor :start_state, :cancel_state

      def do_start(nc)
        @start_state = 1 # write address 7
        @start_state = 0 # write address 7
      end

      def do_cancel(nc)
        @cancel_state = 1 # write address 8
      end
    end

    class Jig <  Nc1# 夹具
      READ_CLOSED_ADD = 3 # 夹具是否已经加紧
      READ_OPENED_ADD = 4 # 夹具是否已经加紧
    end

    class Door < Nc1# 门
      WRITE_OPERATION_ADD = 10  # 1 开门， 0 关门
      READ_OPENED_ADD = 5 # 0,1
      READ_OPENED_ADD = 6 # 0,1
      attr_accessor :state
    end

    class Program < Nc1
      WRITE_NO_ADD = 14 # 切换程序 6000-6020
      attr_accessor :no
    end


  end
end