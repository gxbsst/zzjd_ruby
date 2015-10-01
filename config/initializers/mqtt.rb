# encoding: utf-8
$mqtt = MQTT::Client.connect('127.0.0.1')

$mqtt.subscribe('workstations/1/nc/0001/0001')
# 工位监听
WorkstationWorker.perform_async
# 各设备数据采集
DaqWorker.perform_async