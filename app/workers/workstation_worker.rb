# encoding: utf-8
class WorkstationWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  def perform
      # If you pass a block to the get method, then it will loop
      $mqtt.get("test") do |topic,message|

        logger.info("*"*20)
        logger.info("#{topic} - #{message}")
        logger.info("*"*20)
        # WORKSTATION1001
        # if workstation/1001/robot
        #   if massage == put ok
                # equipment do something
        #
        # if workstation/1001/nc


        # WORKSTATION1002
        # if workstation/1002/robot
        #   if massage == put ok
        # equipment do something
        #
        # if workstation/1002/nc


        # WORKSTATION1003
        # if workstation/1002/robot
        #   if massage == put ok
        # equipment do something
        #
        # if workstation/1003/nc



        # WORKSTATION1004
        # if workstation/1001/robot
        #   if massage == put ok
        # equipment do something
        #
      end
  end
end
