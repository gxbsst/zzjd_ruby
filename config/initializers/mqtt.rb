# encoding: utf-8
$mqtt = MQTT::Client.connect('127.0.0.1')
$mqtt_nc = MQTT::Client.connect('127.0.0.1')
# $mqtt_duiduo = MQTT::Client.connect('127.0.0.1')
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

# $mqtt_duiduo.subscribe(
#     'workstations/1/duiduo/2001/6496', # 物流方向--01入库--02出库--03取空货箱
#     'workstations/1/duiduo/2001/6497', # 入/出库位置
#     'workstations/1/duiduo/2001/6498', # 料台位置--01南料台--02北侧料台
#     'workstations/1/duiduo/2001/6502', # 清理入库、出库、取空箱完成标志位
#     'workstations/1/duiduo/2001/6500', # 物流状态----00堆垛车网络掉线--01正常（空闲）--02忙--03空闲报警--04运行报警
#     'workstations/1/duiduo/2001/6501', # 传送链叫料---01需要上料（出库）
#     'workstations/1/duiduo/2001/6502', # 入库/出库工作完成状态--01入库完成--02出库完成--03取空箱完成
#     'workstations/1/duiduo/2001/6503', # 入/出库位置--入库/出库/取空箱位置
#     'workstations/1/duiduo/2001/6504' # 料台位置
# )

$mqtt_robot.subscribe(
    'workstations/1/robots/0001/0001',
    'workstations/1/robots/0001/0001',
)

$mqtt_agv.subscribe(
    'workstations/1/robots/0001/0001',
    'workstations/1/robots/0001/0001',
)

if Rails.env == 'production'
# 各设备数据采集
DaqWorker.perform_async
MqttDuiduoWorker.perform_async
MqttRobotWorker.perform_async
# ParseAgvStatusWorker.perform_async
Tcs::OrderLine.parse_xml
end
