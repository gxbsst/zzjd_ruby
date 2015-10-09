json.data do
  json.array! @collections do |collection|
    json.partial! 'api/v1/work_centers/work_centers', work_order: collection
  end
end
json.meta do

end