json.extract! product, :id, :remark, :product_type, :name, :no, :standard, :unit
json.cover "http://#{Settings.host.ip}:#{Settings.host.port}/v1/resources/actions/#{product.covers[0].try(:id)}/show"
