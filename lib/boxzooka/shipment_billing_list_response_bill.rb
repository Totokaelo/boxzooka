module Boxzooka
  class ShipmentBillingListResponseBill < BaseElement
    # Date/Time the Bill data was received.
    scalar :bill_date, type: :datetime

    # Weight used to calculate billing, generally based on whichever is
    # greater between GravitionalWeight and DimensionalWeight
    scalar :chargeable_weight, type: :decimal

    # Identifies the consolidation in which the shipment was included.
    scalar :consolidation_id, node_name: 'ConsolidationID'

    # Date/Time the consolidation was created, if any.
    scalar :consolidation_date, type: :datetime

    # Unit of measurement used by DimWidth DimHeight & DimLength fields.
    # IN or CM
    scalar :dim_unit

    # Calculated dimensional weight, if needed.
    scalar :dimensional_weight, type: :decimal

    # Actual weight of package.
    scalar :gravitational_weight, type: :decimal

    # Height of package, if measured.
    scalar :height, type: :decimal

    # Length of package, if measured.
    scalar :length, type: :decimal

    # Order ID corresponding to Bill.
    scalar :order_id, node_name: 'OrderID'

    # Date/Time the Order data was received.
    scalar :order_date, type: :datetime

    # Billed cost of shipment.
    scalar :price, type: :decimal

    # Order Currency, 3-char
    scalar :price_currency

    # Date/Time that the Shipment prepared for shipment.
    scalar :shipment_date, type: :datetime

    # Tracking Code.
    scalar :tracking_code

    # Unit of weight used by Weight field
    # LBS or KGS
    scalar :weight_unit

    # of package, if measured.
    scalar :width, type: :decimal
  end
end
