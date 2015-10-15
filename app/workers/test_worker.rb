require 'celluloid'

class MyPoller
  include Celluloid
  include Celluloid::IO

  def initialize
    @socket = TCPSocket.open('127.0.0.1', 33334)
    async.reader
  end

  def reader
    loop do
      data = @socket.read
      process_data(data)
    end
  end

  def process_data(data)
    puts data
    parse_xml(data)
    #do some really cool stuff here
  end

  def writer(msg)
    @socket.write(msg)
  end


  def parse_xml(xml_data)
    doc = Nokogiri.XML(xml_data)
    element = doc.xpath("//status")
    order_state = element.attr('orderState').try(:value)
    if order_state == 'True'
      puts("order state is true")
      # sleep 2
      send_one_order
    else
      puts("order state is false")
    end
  end

  def send_one_order
    name = "J1轴的生产计划"
    production_no = '000002'
    product_number = 1
    product = Products::Product.find_by_no(3008)
    production_order = Productions::ProductionOrder.find_or_create_by(
        production_no: production_no,
        product: product
    )
    production_order.send_xml
  end
end


