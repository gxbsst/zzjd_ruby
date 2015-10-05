json.data do
  json.array! @collections do |collection|
    json.partial! 'api/v1/production_orders/production_order', production_order: collection
    json.work_orders collection.orders
  end
end
json.meta do

end