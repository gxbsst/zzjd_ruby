# encoding: utf-8
# 立体仓库工位
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

class Productions::WorkOrderExecutionWms < Productions::WorkOrderExecution


  def agv_arrived?
    true
    #
    TCS::OrderLine
  end

  state_machine :state, :initial => :unstart do
    event :agv_ready do
      transition [:unstart] => :agv_ready
    end

    # 通知机器人开始动作
    # after_transition :unstart => :agv_ready do |er, transition|
    #   er.do_notify_duiduoche_get
    # end

    event :notify_duiduoche do
      transition [:agv_ready] => :notified_duiduoche
    end

    event :complete do
      transition [:notified_duiduoche] => :completed
    end

    # 通知机器人开始动作
    # after_transition :notified_duiduoche => :completed do |er, transition|
    #   er.do_notify_agv
    # end

    # state :agv_ready, :notified do
    #   def work_order_state
    #    'processing'
    #   end
    # end
  end
  
  # after_transition :notified_robot => :completed do |er, transition|
  #   er.do_notify_agv
  # end

  def do_notify_duiduoche_get
    # TODO: what is the x,y,z
    # 通过正在执行的工单找到对应的产品的库存位置
    ip = '192.168.7.5'
    # add =
    values = [1]
    Modbus.write(ip, add, values, &block)
  end


  # value = [1,1,1] 第一个1表示入库，2表示出库，第二个1表示库位， 第三个1表示料台
  #
  def in_stock(*value)
    # 入库
    ip = '192.168.7.5'
    # add = 6496
    # values = 1
    # Modbus.write(ip, add, values)
    #
    # # 入库的库位
    # add = 6497
    # values = 1
    # Modbus.write(ip, add, values)
    #
    # # 入库的料台
    # add = 6498
    # values = 1
    # Modbus.write(ip, add, values)


    ModBus::TCPClient.new(ip, 502) do |cl|
      cl.with_slave(1) do |slave|
        r = slave.holding_registers[6496..6498] = value
        yield r if block_given?
      end
    end

  end


  def in_stocked_status(add)
    ip = '192.168.7.5'
    r = Modbus.read(ip, add) do |result|
      puts result
    end
  end

  # 当入库完成，清除出入库状态位
  def clear_in_out_status
    ip = '192.168.7.5'
    add = 6502
    values = 0
    r = Modbus.write(ip, add, values)
  end

  def do_notify_duiduoche_put
    ip = '192.168.1.1'
    add = 201010
    values = [1]
    Modbus.write(ip, add, values, &block)
  end

  def do_notify_agv
    # 找到这个工位的AGV小车，然后

    # 找到对应PLC，发送IO信号
    # workstation.notify_agv
  end

end
