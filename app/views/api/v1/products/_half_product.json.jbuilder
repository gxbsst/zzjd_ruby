json.extract! product, :id, :remark, :product_type, :name, :no, :standard, :unit
json.cover "http://192.168.1.157:3000/v1/resources/actions/#{product.covers[0].try(:id)}/show"
