require 'boxzooka/list_request'

module Boxzooka
  class OrdersListRequest < ListRequest
    root node_name: 'OrdersList'

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

    # Minimum date of when the order data was sent / received
    filter :date_from

    # Maximum date of when the order data was sent / received
    filter :date_to

    # Email of recipient
    filter :email

    # First name of recipient
    filter :first_name

    # Last name of recipient
    filter :last_name

    # Shipping Method of Order. Use Boxzooka's method codes.
    filter :method

    # Unique ID of order
    filter :order_id, node_name: 'OrderID'

    # Phone number of recipient
    filter :phone

    # Province of recipient
    filter :province

    # PostalCode of recipient
    filter :postal_code

    # Sku of product in shipment
    filter :sku

    # Status of order
    filter :status

    # Maximum order value
    filter :value_max

    # Minimum order value
    filter :value_min
  end
end
