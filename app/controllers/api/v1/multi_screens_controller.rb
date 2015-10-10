module Api
  module V1
    class  MultiScreensController < BaseController
      def index
        begin
          ModBus::TCPClient.new(Settings.multi_screen.ip, 502) do |cl|
            registers = [0..5]
            cl.with_slave(2) do |slave|
              @result = slave.holding_registers[registers]
            end
          end
        rescue Exception => e
        end

      end

      def update
        register = params[:id]
        value  params[:value]
        ModBus::TCPClient.new(Settings.multi_screen.ip, 502) do |cl|
          registers = [0..5]
          cl.with_slave(2) do |slave|
            @result = slave.holding_registers[register] = value
          end
        end
      end
    end
  end
end
