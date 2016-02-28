module Boxzooka
  class ReturnNotificationItem < BaseElement
    # Sku of product being returned
    scalar :sku

    # Quantity of SKU being returned
    scalar :quantity, type: :integer

    # Reason for return
    scalar :reason

    # Instruction concerning what the warehouse should do with the return, i.e. “Dispose”,
    # “Return to inventory”, etc.
    scalar :directive
  end
end
