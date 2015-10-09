json.extract! work_order, :id,:work_order_no,:status, :begin_date,:operation_name,:takes
json.workstation work_order.workstation.try(:name)
json.production_order work_order.production_order.try(:production_no)
json.product_name work_order.production_order.product.try(:name)
