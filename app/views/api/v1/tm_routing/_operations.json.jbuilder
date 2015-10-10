json.extract! operation, :id,:note,:name,:sequence,:workstation_id,:workstation

json.url "http://#{Settings.host.ip}:#{Settings.host.port}/v1/resources/actions/#{operation.resources[0].try(:id)}/show"
# json.production_order work_order.production_order.try(:production_no)
# json.product_name work_order.production_order.product.try(:name)
