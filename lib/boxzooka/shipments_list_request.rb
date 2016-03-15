require 'boxzooka/list_request'

module Boxzooka
  class ShipmentsListRequest < ListRequest
    root node_name: 'ShipmentsList'

    filter :address1
    filter :address2
    filter :address3
    filter :category
    filter :city
    filter :country_code
    filter :date_from
    filter :date_to
    filter :email
    filter :first_name
    filter :last_name
    filter :phone
    filter :po, node_name: 'PO'
    filter :postal_code
    filter :province
    filter :order_date_from
    filter :order_date_to
    filter :order_value_max
    filter :order_value_min
    filter :sku
    filter :status
    filter :tracking_code
    filter :warehouse_id, node_name: 'WarehouseID'
    filter :weight_min
    filter :weight_max
  end
end
