require 'boxzooka/list_request'

module Boxzooka
  class ShipmentsListRequest < ListRequest
    root node_name: 'ShipmentsList'

    # Address line 1
    filter :address1

    # Address line 2
    filter :address2

    # Address line 3
    filter :address3

    # Category of product in shipment
    filter :category

    # City of recipient
    filter :city

    # CountryCode of recipient. ISO2
    filter :country_code

    # Minimum date of when the shipment was created.
    filter :date_from

    # Maximum date of when the shipment was created.
    filter :date_to

    # Email of recipient
    filter :email

    # First name of recipient
    filter :first_name

    # Last name of recipient
    filter :last_name

    # Phone number of recipient
    filter :phone

    # PO number of shipment.
    filter :po, node_name: 'PO'

    # Postal Code of recipient.
    filter :postal_code

    # Province of recipient.
    filter :province

    # Minimum date of when the order data was sent / received
    filter :order_date_from

    # Maximum date of when the order data was sent / received
    filter :order_date_to

    # Maximum order value
    filter :order_value_max

    # Minimum order value
    filter :order_value_min

    # Sku of product in shipment
    filter :sku

    # Status of shipment
    filter :status

    # Tracking Code of shipment
    filter :tracking_code

    # ID of warehouse where the shipment was created
    filter :warehouse_id, node_name: 'WarehouseID'

    # Maximum weight of package (LBs)
    filter :weight_max

    # Minimum weight of package (LBs)
    filter :weight_min
  end
end
