  class Modbus
    class << self

      def write(ip, add, values, &block)
        ::ModBus::TCPClient.new(ip, 502) do |cl|
          cl.with_slave(1) do |slave|
            r = slave.holding_registers[add] = values
            yield r if block_given?
          end
        end
      end

      def read(ip, add)
        ::ModBus::TCPClient.new(ip, 502) do |cl|
          cl.with_slave(1) do |slave|
            r = slave.holding_registers[add]
            yield r if block_given?
          end
        end
      end

    end
  end
