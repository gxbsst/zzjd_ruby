#  encoding: utf-8
module Api
  module V1
    class WorkCentersController < BaseController

      # 机器人装配线正在工作内容
      def show
        # 定义机器人装配线工位编号数组
        robot_workstations_no =[1010, 1011, 1012, 1013, 1014, 1015]
        # 定义准备返回的数组

        # 查询进行中的工单
        work_orders = Productions::WorkOrder.processing

        @collections = []
         work_orders.each do |work_order|
          if work_order.operation && (robot_workstations_no.include? work_order.operation.workstation.no.to_i)
             @collections << work_order
          end
        end


        @collections.uniq.compact!


        # # # 判断是否返回的为null
        # # if work_orders == nil
        # #   work_orders=[]
        # # end
        #
        # for work_order in work_orders
        #   #判断进行中的工位是否是属于机器人装配线
        #   no = work_order.workstation.no
        #
        #   if (work_station.index(no.to_i)) != nil
        #   # 如果是
        #     @collections.push(work_order)
        #   end
        #
        # end
      end

    end
  end
end