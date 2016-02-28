require 'boxzooka/address'
require 'boxzooka/order_item'

module Boxzooka
  # This targets the Fulfillment API.
  class Order < BaseElement
    # Date after which an order is no longer valid. This information helps in fulfillment prioritization.
    scalar :cancel_date, type: :datetime

    # Name of carrier, if specific carrier is required
    scalar :carrier

    # Required if Carrier field has value
    scalar :carrier_account_no

    # Shipping method for specified carrier. Required if Carrier field has value.
    scalar :carrier_method

    # Concise description of entire order contents, to be provided to customs.
    # Required for int'l Orders
    scalar :customs_description

    # International commercial terms of shipment (DDU or DDP), defaults to DDU
    scalar :incoterms

    collection :items,
      flat: true,
      entry_field_type: :entity,
      entry_type: Boxzooka::OrderItem,
      entry_node_name: 'Item'

    # Arbitrary field used to specify information be to printed on the shipping label.
    scalar :label_note

    # Numeric/alphanumeric code of shipment method required.
    # Required unless Carrier field has a value.
    scalar :method

    # Order Currency, 3-char
    scalar :order_currency

    # Date/Time that the order was placed. Useful for analytics.
    scalar :order_date, type: :datetime

    # Unique order ID, used for future reference of order. Can also be used to update an
    # existing order before transit begins.
    scalar :order_id, node_name: 'OrderID'

    # Order Value
    scalar :order_value, type: :decimal

    # Address to ship to
    entity :ship_to, type: Boxzooka::Address

    # Special instructions, note to customer, etc. This is an arbitrary field
    # used to specify information be to printed on the packing slip.
    scalar :slip_note
  end
end
