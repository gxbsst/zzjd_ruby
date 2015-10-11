# encoding: utf-8
class ModbusRobot

  WRITE_ACTION =  4096
  WRITE_STATION_1010 = 4097
  WRITE_STATION_1011 = 4098
  WRITE_STATION_1012 = 4099
  WRITE_STATION_1013 = 4100
  WRITE_STATION_1014 = 4101
  WRITE_STATION_1015 = 4102
  READ_STATUS = 4103 #1 完成 2 进行中 3 Error 4 准备完成
  READ_ERROR_CODE = 4104

  ADDRESS_MAP_WORKSTATION_NO = {
      "1010"  => 4097,
      "1011" => 4098,
      "1012" => 4099 ,
      "1013" => 4100,
      "1014" =>  4101,
      "1015"  => 4102
  }

  attr_accessor :w_4096, :w_4097, :w_4098, :w_4099, :w_4100, :w_4101, :w_4102, :r_4103, :r_status, :r_error_code

  def self.build
   self.new
  end

  def initialize
    sync
  end

  def sync
    begin
      ModBus::TCPClient.new(Settings.robot_plc.ip, 502) do |cl|
        cl.with_slave(1) do |slave|
          @w_4096, @w_4097,@w_4098, @w_4099, @w_4100, @w_4101, @w_4102, @r_status, @r_error_code = slave.holding_registers[WRITE_ACTION..READ_STATUS]
        end
      end
    rescue ModBus::Errors::ModBusTimeout => e
      Rails.logger.info("*"*100)
      Rails.logger.info("IP地址:#{Settings.robot_plc.ip}是不是设置错了啊, Modbus无法连接!!!")
      Rails.logger.info("*"*100)
    end
    self
  end

  def start(workstation_no)
    sync
    raise '有错误发生， 请联系电器工程师' if self.error?
    begin
      ModBus::TCPClient.new(Settings.robot_plc.ip, 502) do |cl|
        cl.with_slave(1) do |slave|
          slave.holding_registers[WRITE_ACTION] = 1
          slave.holding_registers[ADDRESS_MAP_WORKSTATION_NO[workstation_no.to_s]] = 1
        end
      end
    rescue ModBus::Errors::ModBusTimeout => e
      Rails.logger.info("*"*100)
      Rails.logger.info("IP地址:#{Settings.robot_plc.ip}是不是设置错了啊, Modbus无法连接!!!")
      Rails.logger.info("*"*100)
    end
    self
  end

  def clear(workstation_no)
    sync
    begin
      ModBus::TCPClient.new(Settings.robot_plc.ip, 502) do |cl|
        cl.with_slave(1) do |slave|
          if workstation_no == 'all'
            slave.holding_registers[WRITE_ACTION..WRITE_STATION_1015] = [0,0,0,0,0,0,0]
          else
            slave.holding_registers[WRITE_ACTION] = 0
            slave.holding_registers[ADDRESS_MAP_WORKSTATION_NO[workstation_no]] = 0
          end
        end
      end
    rescue ModBus::Errors::ModBusTimeout => e
      Rails.logger.info("*"*100)
      Rails.logger.info("IP地址:#{IP}是不是设置错了啊, Modbus无法连接!!!")
      Rails.logger.info("*"*100)
    end
    self
  end

  def completed?
    self.r_status == 1
  end

  def processing?
    self.r_status == 2
  end

  def error?
    self.r_status == 3
  end

  def read_complete?
    self.r_status == 4
  end

end