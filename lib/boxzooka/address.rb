module Boxzooka
  class Address < BaseElement
    # Address Line 1
    scalar :address1

    # Address Line 2
    scalar :address2

    # Address Line 3
    scalar :address3

    # Shipment City
    scalar :city

    # Shipment Company
    scalar :company

    # Shipment country code. ISO2.
    scalar :country_code

    # Shipment email address
    scalar :email

    # Shipment first name
    scalar :first_name

    # Shipment last name
    scalar :last_name

    # Shipment phone #
    scalar :phone

    # Shipment Postal Code
    scalar :postal_code

    # Shipment State or Province
    scalar :province

    # Shipment customer tax ID
    scalar :tax_id, node_name: 'TaxID'
  end
end
