# encoding: utf-8
class DuiduoWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  def perform
    $mqtt_duiduo.get do |topic,message|
      _, workstation_id, name, equipment_no, address = topic.split('/')

      add_1 = 6497 # 物流方向--01入库--02出库--03取空货箱
      add_2 = 6498 # 入/出库位置
      add_3 = 6499 # 料台位置--01南料台--02北侧料台
      add_4 = 6503 # 清理入库、出库、取空箱完成标志位
      add_5 = 6501 # 物流状态----00堆垛车网络掉线--01正常（空闲）--02忙--03空闲报警--04运行报警
      add_6 = 6502 # 传送链叫料---01需要上料（出库）
      add_7 = 6503 # 入库/出库工作完成状态--01入库完成--02出库完成--03取空箱完成
      add_8 = 6504 # 入/出库位置--入库/出库/取空箱位置
      add_8 = 6505 # 料台位置

      equipment = Workcenters::Equipment.find_by(no: equipment_no)
      if equipment
        Workcenters::EquipmentDaq.find_or_create_by(equipment: equipment) do |daq|
          daq.address = address
          daq.value = message
          daq.name = name
          daq.save
        end
      end
    end
  end
end