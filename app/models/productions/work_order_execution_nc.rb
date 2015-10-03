# encoding: utf-8
# NC设备加工工位
class Productions::WorkOrderExecutionNC < Productions::WorkOrderExecution

  state_machine :state, :initial => :unstart do
    event :agv_ready do
      transition [:unstart] => :agv_ready
    end

    # 通知机器人开始动作
    # after_transition :unstart => :agv_ready do |er, transition|
    #   er.do_notify_robot
    # end

    event :notify_robot do
      transition [:agv_ready] => :notified_robot
    end

    event :complete do
      transition [:notified_robot] => :completed
    end

    # 通知机器人开始动作
    # after_transition :notified_robot => :completed do |er, transition|
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

  def do_notify_robot
    # 找到这个工位
    workstation = self.work_order.workstation

    # 找到对应PLC，发送IO信号
    workstation.notify_robot
  end

  def do_notify_agv
    # 找到这个工位的AGV小车，然后

    # 找到对应PLC，发送IO信号
    # workstation.notify_agv
  end

end
