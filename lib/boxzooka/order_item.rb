module Boxzooka
  class OrderItem < BaseElement
    # Necessary for customs classification.
    scalar :description

    # Notes regarding hold_status.
    # ONLY returned by Boxzooka, ie writing to this does nothing.
    scalar :hold_notes

    # Status of a hold on the item, if applicable.
    # ONLY returned by Boxzooka, ie writing to this does nothing.
    scalar :hold_status

    # Amount "saved" on the item.
    scalar :item_discount, type: :decimal

    # Status of the Item.
    # ONLY returned by Boxzooka, ie writing to this does nothing.
    scalar :item_status

    # Url of product. Recommended if unit value is different from the value declared when
    # sending this product’s information in the Products data set.
    scalar :product_url

    # Number of items
    scalar :quantity, type: :integer

    # A more concise and meaningful description than your standard Description field.
    # Something “to the point” i.e. “Wool Knit Cap” or “Denim Jeans”.
    # Very useful for customs classification.
    scalar :short_description

    # Product SKU - Unique identifier for each product
    scalar :sku

    # Declared value of single product
    scalar :unit_value, type: :decimal

    # Weight of single product. Used as secondary weight reference, when needed.
    scalar :unit_weight, type: :decimal

    # Weight measurement unit of UnitWeight field.
    # "KGS" or "LBS"
    scalar :weight_unit
  end
end
