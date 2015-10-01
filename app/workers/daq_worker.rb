# encoding: utf-8
class DaqWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  def perform
    # If you pass a block to the get method, then it will loop
    $mqtt.get("workstations/1/nc/0001/0001") do |topic,message|
      logger.info("*"*100)
      logger.info(topic)
      _, workstation_id, name, equipment_no, address = topic.split('/')
      equipment = Workcenters::Equipment.find_by_no(equipment_no)

      Workcenters::EquipmentDaq.find_or_create_by(equipment: equipment) do |daq|
        daq.address = address
        daq.value = message
        daq.name = name
        daq.save
      end

      logger.info(Workcenters::EquipmentDaq.last.inspect)
    end
  end
end