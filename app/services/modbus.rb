  class Modbus
    class << self

      def write(ip, add, values, &block)
        ::ModBus::TCPClient.new(ip, 502) do |cl|
          cl.with_slave(2) do |slave|
            r = slave.holding_registers[add] = values
            yield r if block_given?
          end
        end
      end

      def read(ip, add, &block)
        ::ModBus::TCPClient.new(ip, 502) do |cl|
          cl.with_slave(2) do |slave|
            r = slave.holding_registers[add]
            if block_given?
              yield r
            else
              r
            end
          end
        end
      end

    end
  end
