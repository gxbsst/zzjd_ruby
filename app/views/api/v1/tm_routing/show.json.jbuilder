json.data do
  json.routing_code @routing.code
  json.routing_name @routing.name
  json.operations do
    json.array! @operations do |operation|
      json.partial! 'api/v1/tm_routing/operations', operation: operation
    end
  end
end
json.meta do

end