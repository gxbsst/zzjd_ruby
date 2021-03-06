# encoding: utf-8
class ParseAgvStatusWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  def perform(xml_data)
    if xml_data.include?("orderName")
      location_name, order_name = parse_xml(xml_data)
      notify_workstation_orking(location_name, order_name)
    end
  end

  # 小车到站
  def parse_xml(xml_data)
    doc = Nokogiri.XML(xml_data)
    element = doc.xpath("//statusMassage")
    # position = element.attr('position').try(:value)
    # processing_state = element.attr('processingState').try(:value)
    # vehicle_name = element.attr('vehicleName').try(:value)
    # state = element.attr('state').try(:value)
    order_name = element.attr('orderName').try(:value)
    order_state = element.attr('orderState').try(:value)
    executing_vehicle = element.attr('executingVehicle').try(:value)
    sub_element = doc.xpath("//statusMassage/destination")
    location_name = sub_element.attr("locationName").try(:value)
    state = sub_element.attr('state').try(:value)

    update_tcs_order(executing_vehicle, order_name)
    update_tcs_order_line.update(order_name, location_name, state)
    return location_name, order_name
  end

  def update_tcs_order(executing_vehicle, order_name)
    tcs_order = Tcs::Order.find_by(order_name: order_name)
    tcs_order.update_attribute(vehicle: executing_vehicle) if tcs_order
  end

  def update_tcs_order_line(order_name, location_name, state)
    tcs_order = Tcs::Order.find_by(order_name: order_name)
    tcs_order_line = tcs_order.order_lines.where(destination_name: location_name).try(:first)
    if tcs_order_line
      tcs_order_line.update(location_name: location_name, status: state)
    end
  end

  def notify_workstation_working(location_name, order_name)
    order_line = Tcs::OrderLine.find_by(order_name: order_name)
    if order_line
      workstation = Workcenter::Workstation.find_by_no(location_name)
      workstation.start_working(order_line)
      #work_orders = po.orders
      order_line.status = 'finished'
      order_line.save!

      logistics = order_line.logistics_chains.try(:first)
      if logistics
        logistics.update!(status: 'finished')
      end

      # TODO:
      # 堆垛车执行
      # d = Equipments::Duiduoche.build
      # d.in_stock()
    end
  end
end