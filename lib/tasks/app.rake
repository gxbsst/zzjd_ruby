# encoding: utf-8
namespace :app do
  desc "同步资源库对应用户"
  task :init_data => :environment do
    init_workstations
    init_equipments
    init_products
    init_bom
    init_routings
    init_locations
    init_trays
  end

  def init_workstations
    result = YAML.load_file(Rails.root + 'lib/tasks/init_data/workstation.yml')
    map_type = {
        'wms' =>  'Workcenters::WorkstationWms',
        'nc' =>  'Workcenters::WorkstationNc',
        'robot' => 'Workcenters::WorkstationRobot',
        'test' => 'Workcenters::WorkstationTest'
    }
    result['workstations'].each do |w|
      print "."
      ::Workcenters::Workstation.find_or_create_by(no: w['no']) do |ws|
        ws.type = map_type[w['type']]
        ws.name = w['name']
      end
    end
  end

  def init_equipments
    result = YAML.load_file(Rails.root + 'lib/tasks/init_data/equipment.yml')
    result['equipments'].each do |e|
      print "."
      equipment = Workcenters::Equipment.find_or_create_by(no: e['no']) do |ws|
        ws.e_type = e['type']
        ws.name = e['name']
      end

      workstation = Workcenters::Workstation.find_by_no(e['workstation_no'])

      Workcenters::Resource.create(owner: equipment, workstation: workstation )
    end
  end

  def init_products
    result = YAML.load_file(Rails.root + 'lib/tasks/init_data/product.yml')
    result['products'].each do |e|
       Products::Product.find_or_create_by(no: e['no']) do |ws|
        ws.product_type = e['product_type']
        ws.name = e['name']
      end
    end
  end

  def init_bom
    result = YAML.load_file(Rails.root + 'lib/tasks/init_data/bom.yml')
    result['boms'].each do |e|
      product = Products::Product.find_by_no(e['product_no'])
      bom =  Products::Bom.find_or_create_by(no: e['no']) do |ws|
        ws.product_id = product.id if product
      end

      e['materials'].each do |product_no|
        product = Products::Product.find_by_no(product_no)
        bom.bom_lines.create(product_id: product.id, bill_of_material_id: bom.id)
      end

    end
  end

  def init_routings
    result = YAML.load_file(Rails.root + 'lib/tasks/init_data/routing.yml')
    result['routings'].each do |r|
      product = Products::Product.find_by_no(r['product_no'])
      routing = TechManagements::Routing.find_or_create_by!(product_id: product.id)
      routing.name = product.name
      routing.save

      # 创建工序
      r['operations'].each_with_index do |o, index|
        workstation = Workcenters::Workstation.find_by_no(o['workstation_no'])
        materials = Products::Product.where(no: o['materials'])

        routing.operations.find_or_create_by(workstation_id: workstation.id, name: o['name'], sequence: index+1) do |operation|
          operation.save!
          # 需要的材料

          materials.each do |material|
            operation.materials.create(product_id: material.id, qty: 1)
          end
        end
      end
    end
  end

  def init_locations
    result = YAML.load_file(Rails.root + 'lib/tasks/init_data/locations.yml')
    type = Wms::LocationType.find_or_create_by(type: 'normal')
    result['locations'].each do |location|

     Wms::Location.find_or_create_by(x: location['x'], y: location['y'], z: location['z']) do |l|
      l.no = location['no']
      l.area = location['area']
      l.aisle = 1
      l.location_type = type.id
      l.plc_state = location['plc_state']
      l.outgoing_active = location['outgoing_active']
      l.counting_active = location['counting_active']
     end
    end
  end

  # 托盘
  def init_trays
    result = YAML.load_file(Rails.root + 'lib/tasks/init_data/tray.yml')
    result['trays'].each do |tray|

      # product: ,
      #     barcode: "1004",
      #     state: ,
      #     empty: ,
      #     transport_unit_type: ,
      #     product_quantity: ,
      #     target_location:

      Wms::TransportUnit.find_or_create_by(barcode: tray['barcode']) do |tr|
        tr.state = tray['state']
        tr.empty = tray['empty']
        tr.transport_unit_type = tray['transport_unit_type']
        tr.product_quantity = tray['product_quantity']
        tr.target_location = tray['target_location']
      end
    end
  end


  desc "生成调AGV拨单测试数据"
  task :create_tcs_order => :environment do
    #
    # let(:workstation) { create :workstation, no: 1003 }
    # let(:workstation1) { create :workstation, no: 1004 }
    # let(:operation1) { create :operation, sequence: 1, name: 'operation 1', workstation: workstation }
    # let(:operation2) { create :operation, sequence: 2, name: 'operation 2', workstation: workstation1 }
    # let(:routing) { create :routing, operations: [operation1, operation2]}
    # let(:product) { create :product, routing: routing}
    #
    # workstations = Workcenters::Workstation.where(no: [1010, 1011, 1012, 1013, 1014])
    name = "测试的生产计划"
    production_plan_no = '000002'
    product_number = 1
    status = "draft"

    product = Products::Product.find_by_no(3001)

    plan = Productions::Plan.find_or_create_by!(name: name, production_plan_no: production_plan_no, product_number: product_number, product_id: product.id, status: "draft")


  end

end
