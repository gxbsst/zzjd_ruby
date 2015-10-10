json.data do
  json.array! @collections do |collection|
    json.partial! 'api/v1/products/half_product', product: collection
  end
end
json.meta do

end