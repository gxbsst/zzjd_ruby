json.data do
  json.array! @collections do |collection|
    json.partial! 'api/v1/products/product', product: collection
  end
end
json.meta do

end