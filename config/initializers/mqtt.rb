# encoding: utf-8
$mqtt = MQTT::Client.connect('127.0.0.1')
$mqtt_nc = MQTT::Client.connect('127.0.0.1')
$mqtt_duiduo = MQTT::Client.connect('127.0.0.1')
$mqtt_robot = MQTT::Client.connect('127.0.0.1')
$mqtt_agv = MQTT::Client.connect('127.0.0.1')

$mqtt_nc.subscribe(
    'workstations/1/nc/0001/0001',
    'workstations/2/nc/0002/0001',
    'workstations/3/nc/0003/0001',
    'workstations/4/nc/0004/0001',
    'workstations/5/nc/0005/0001',
    'workstations/7/nc/0006/0001',
)

$mqtt_duiduo.subscribe(
    'workstations/1/duiduo/0001/0001',
)

$mqtt_robot.subscribe(
    'workstations/1/robots/0001/0001',
    'workstations/1/robots/0001/0001',
)

$mqtt_agv.subscribe(
    'workstations/1/robots/0001/0001',
    'workstations/1/robots/0001/0001',
)
# 工位监听
WorkstationWorker.perform_async
# 各设备数据采集
DaqWorker.perform_async