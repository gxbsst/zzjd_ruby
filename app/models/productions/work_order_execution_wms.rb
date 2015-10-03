# encoding: utf-8
# 立体仓库工位
# 一体机写（PLC读写）：

# 6497----物流方向--01入库--02出库--03取空货箱
# 6498---入/出库位置
# 6499---料台位置--01南料台--02北侧料台
# 6503=5---清理入库、出库、取空箱完成标志位
#
# 一体机读（PLC写）：
# 6501---物流状态----00堆垛车网络掉线--01正常（空闲）--02忙--03空闲报警--04运行报警
# 6502--传送链叫料---01需要上料（出库）
# 6503--入库/出库工作完成状态--01入库完成--02出库完成--03取空箱完成
# 6504---入/出库位置--入库/出库/取空箱位置
# 6505---料台位置

class Productions::WorkOrderExecutionWms < Productions::WorkOrderExecution

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
    ip = '192.168.1.1'
    add = 201010
    values = [1]
    Modbus.write(ip, add, values, &block)
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
