# encoding: utf-8
# 立体仓库工位
class Productions::WorkOrderExecutionWms < Productions::WorkOrderExecution

  state_machine :state, :initial => :unstart do
    event :agv_ready do
      transition [:unstart] => :agv_ready
    end

    # 通知机器人开始动作
    after_transition :unstart => :agv_ready do |er, transition|
      er.do_notify_duiduoche
    end

    event :notify_duiduoche do
      transition [:agv_ready] => :notified_duiduoche
    end

    event :complete do
      transition [:notified_duiduoche] => :completed
    end

    # 通知机器人开始动作
    after_transition :notified_duiduoche => :completed do |er, transition|
      er.do_notify_agv
    end

    # state :agv_ready, :notified do
    #   def work_order_state
    #    'processing'
    #   end
    # end
  end
  
  after_transition :notified_robot => :completed do |er, transition|
    er.do_notify_agv
  end

  def do_notify_duiduoche
    # 找到这个工位
    workstation = self.work_order.workstation

    # 找到对应PLC，发送IO信号
    # workstation.notify_robot
  end

  def do_notify_agv
    # 找到这个工位的AGV小车，然后

    # 找到对应PLC，发送IO信号
    # workstation.notify_agv
  end

end
