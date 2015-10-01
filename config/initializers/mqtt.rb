$mqtt = MQTT::Client.connect('127.0.0.1')

WorkstationWorker.perform_async