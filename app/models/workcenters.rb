module Workcenters
  def self.table_name_prefix
    'mj_'
  end

  class Duiduoche

    IP = '192.168.7.5'

    def self.build
      self.new
    end

    def initialize
      @duiduoche = Workcenters::Equipment.find_by_no(2001)
      raise "还没有堆垛车" if not @duiduoche
      sync
      self
    end

    def duiduoche
      @duiduoche
    end

    # 一体机写（PLC读写）：

    # 6496----物流方向--01入库--02出库--03取空货箱
    # 6497---入/出库位置
    # 6498---料台位置--01南料台--02北侧料台
    # 6502---清理入库、出库、取空箱完成标志位 // 收到完成信号，写5
    #
    # 一体机读（PLC写）：
    # 6500---物流状态----00堆垛车网络掉线--01正常（空闲）--02忙--03空闲报警--04运行报警
    # 6501--传送链叫料---01需要上料（出库）
    # 6502--入库/出库工作完成状态--01入库完成--02出库完成--03取空箱完成
    # 6503---入/出库位置--入库/出库/取空箱位置 // 放好库位之后，返回放好的库位
    # 6504---料台位置


    def sync
      begin
        ModBus::TCPClient.new(IP, 502) do |cl|
          cl.with_slave(1) do |slave|
            @a6496, @a6497, @a6498 = slave.holding_registers[6496..6498]
            @a6500, @a6501, @a6502, @a6503, @a6504 = slave.holding_registers[6500..6504]
          end
        end
      rescue ModBus::Errors::ModBusTimeout => e
        Rails.logger.info("*"*100)
        Rails.logger.info("IP地址是不是设置错了啊, Modbus无法连接!!!")
        Rails.logger.info("*"*100)
      end
      self
    end

    def available?
      sync
      @a6500 == 01 || @a6500 == 1
    end

    def offline?
      sync
      return true if @a6500 == 0 || @a6500 == 00
      false
    end

    def running?
      sync
      return true if @a6500 == 2
      false
    end

    def busy?
      sync
      @a6500 == 02 || @a6500 == 2
    end

    def warning?
      sync
      @a6500 == 03 || @a6500 == 3
    end

    def run_warning?
      sync
      @a6500 == 04 || @a6500 == 4
    end

    def in_stock?
      sync
      @a6496 == 1
    end

    def out_stock?
      sync
      @a6496 == 2
    end

    def work_done?
      sync
      if @a6502 == 2 || @a6502 == 1 || @a6502 == 3
        notify_plc_work_done # 写入PLC
        true
      end
    end

    # value = [1,1] 第一个1表示库位， 第三个1表示料台
    def in_stock(*value)
      address = [1] << value
      begin
        ModBus::TCPClient.new(IP, 502) do |cl|
          cl.with_slave(1) do |slave|
            slave.holding_registers[6496..6498] = address.flatten
          end
        end
      rescue Exception => e
        Rails.logger.info("没有完成，请查看错误日志")
      end
    end

    def out_stock(*value)
      address = [2] << value
      begin
        ModBus::TCPClient.new(IP, 502) do |cl|
          cl.with_slave(1) do |slave|
            slave.holding_registers[6496..6498] = address.flatten
          end
        end
      rescue Exception => e
        Rails.logger.info("没有完成，请查看错误日志")
      end
    end


    # 当入库完成，告诉PLC完成,写入5
    def notify_plc_work_done
      add = 6502
      values = 5
      Modbus.write(IP, add, values)
    end

  end
end
