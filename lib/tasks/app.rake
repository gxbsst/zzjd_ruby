namespace :app do
  desc "同步资源库对应用户"
  task :init_data => :environment do
    # init workstation
    result = YAML.load_file(Rails.root + 'lib/tasks/init_data/workstation.yml')
    map_type = {
        'wms': 'Workcenters::WorkstationWms',
        'nc': 'Workcenters::WorkstationNc',
        'robot': 'Workcenters::WorkstationRobot',
        'test': 'Workcenters::WorkstationTest',

    }
    result['workstations'].each do |w|
      print "."
      ::Workcenters::Workstation.find_or_create_by(no: w['no']) do |ws|
        ws.type = map_type[w['type']]
        ws.name = w['name']
      end
    end

    # init equipments


  end
end
