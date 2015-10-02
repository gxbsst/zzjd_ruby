class InitData < ActiveRecord::Migration
  def change
    # init workstations


    # init equipments
    #   with agv
    #   with robots
    #   with nc
    #   with duiduo car
    # init product
    # init bom
    # init routing
    # init operations
    operations = [
        {
            routing_no: 1,
            operations: [
                {sequence: 1, materials: [1,2], workstation_no: 1, program_no: 1},
                {sequence: 2, materials: [1,2], workstation_no: 2, program_no: 2},
                {sequence: 3, materials: [1,2], workstation_no: 3, program_no: 3},
                {sequence: 4, materials: [1,2], workstation_no: 4, program_no: 4},
                {sequence: 5, materials: [1,2], workstation_no: 5, program_no: 5},
            ]
        },
        {
            routing_no: 2,
            operations: [
                {sequence: 1, materials: [1,2], workstation_no: 1},
                {sequence: 2, materials: [1,2], workstation_no: 2},
                {sequence: 3, materials: [1,2], workstation_no: 3},
            ]
        }
    ]
    # init production plan
    # init production order
    # init work order
    # init avg work order
    # init wms
    #   with transport order
  end
end
