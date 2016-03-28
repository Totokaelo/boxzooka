require 'boxzooka/base_element'

module Boxzooka
  # A Shipment of Items, corresponding to an Order.
  class Shipment < BaseElement
    # Concise description of entire order contents, to be provided to customs.
    # Required for int'l Orders
    scalar :customs_description

    # Identifies the consolidation in which the shipment was included.
    scalar :consolidation_id, node_name: 'ConsolidationID'

    # Cost of shipment.
    scalar :cost, type: :decimal

    # Height of product. Helps with shipping cost evaluation.
    scalar :dim_height, type: :decimal

    # Length of product. Helps with shipping cost evaluation.
    scalar :dim_length, type: :decimal

    # Unit of measurement used by DimWidth DimHeight & DimLength fields
    # IN or CM
    scalar :dim_unit

    # Width of product. Helps with shipping cost evaluation.
    scalar :dim_width, type: :decimal

    # Dimensional weight. Provided if package is measured,
    # and dimensional weight exceeds ShipmentWeight value.
    scalar :dimensional_weight, type: :decimal

    # International commercial terms of shipment (DDU or DDP), defaults to DDU
    scalar :incoterms

    # Invoice Date.
    scalar :invoice_date, type: :datetime

    # Items on the Order.
    collection :items,
      flat: true,
      entry_field_type: :entity,
      entry_type: Boxzooka::OrderItem,
      entry_node_name: 'Item'

    # Numeric/alphanumeric code of shipment method required.
    scalar :method

    # Shipment Notes
    scalar :notes

    # Order Currency, 3-char
    scalar :order_currency

    # Order ID corresponding to Shipment.
    scalar :order_id, node_name: 'OrderID'

    # Order Value
    scalar :order_value, type: :decimal

    # Package ID.
    scalar :package_id, node_name: 'PackageID'

    # Purchase Order Number.
    scalar :po, node_name: 'PO'

    # Address to ship to
    entity :ship_to, type: Boxzooka::Address

    # Special instructions, note to customer, etc. This is an arbitrary field
    # used to specify information be to printed on the packing slip.
    scalar :slip_note

    # Date/Time that the Shipment prepared for shipment.
    scalar :shipment_date, type: :datetime

    # Status of shipment.
    scalar :status

    # Tracking Code.
    scalar :tracking_code

    # Weight of shipment as recorded by Boxzooka scales.
    scalar :shipment_weight, type: :decimal

    # Unit of weight used by Weight field
    # LBS or KGS
    scalar :weight_unit
  end
end
