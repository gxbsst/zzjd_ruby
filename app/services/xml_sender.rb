class XMLSender

  class AssembleLine < self

    def initialize

    end

    def send_xml(device_id=11)
      host =  Settings.device_management.robot.ip
      port =  Settings.device_management.robot.send_port
      client_socket = TCPSocket.new(host, port)
      client_socket.write(self.to_xml(device_id))
      client_socket.close_write # Send EOF after writing the request.
      while result = client_socket.gets
        parse_xml(result)
        puts result
      end
      # parse_xml(client_socket.read)
    end

    def to_xml(device_id=11)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.ProductionOrder("xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "type" => 'robot_assemble', "device" => "#{device_id}")
      end
      builder.to_xml
    end

    def send_trigger_xml(device_name, task_name)
      host =  Settings.device_management.robot.ip
      port =  Settings.device_management.robot.send_port
      client_socket = TCPSocket.new(host, port)
      client_socket.write(self.to_trigger_xml(device_name, task_name))
      client_socket.close_write # Send EOF after writing the request.
      while result = client_socket.gets
        parse_trigger_xml(result)
        puts result
      end
      # parse_xml(client_socket.read)
    end


    def to_trigger_xml(device_name, task_name)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.ProductionOrder("xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "type" => 'trigger') {
          xml.workorderTrigger("device" => "#{device_name}", "task" => "#{task_name}")
        }
      end
      builder.to_xml
    end

    def parse_trigger_xml(data)
      begin
        doc = Nokogiri.XML(data)
        text = doc.text
        element =  doc.xpath("//ProductionResponse")
        status = element.attr('creationSuccessful').value
        task_name = element.attr('orderName').value
        if status == 'True'
          items = text.split(")(")
          items.each do |i|
            device_name, operation_name, params = i.split(",")
            print "create device operation task, device_name:#{device_name}, operation_name: #{operation_name}"
            DeviceOperationTask.create(task_name: task_name, device_name: device_name, operation_name: operation_name, params: params)
          end
        end
      rescue Exception => e
      end
    end

    def parse_xml(data)
      begin
        doc = Nokogiri.XML(data)
        text = doc.text
        element =  doc.xpath("//ProductionResponse")
        status = element.attr('creationSuccessful').value
        task_name = element.attr('orderName').value
        # order = element.xpath("//order")
        if status == 'True'
          items = text.split(")(")
          items.each do |i|
            device_name, operation_name, params = i.split(",")
            print "create device operation task, device_name:#{device_name}, operation_name: #{operation_name}"
            DeviceOperationTask.create(task_name: task_name, device_name: device_name, operation_name: operation_name, params: params)
          end
        end
      rescue Exception => e
      end
    end
  end
end

