module Boxzooka
  # Corresponding to the <Response> entity on the Order Cancellation Response.
  class OrderCancellationResponseResponse < BaseElement
    root node_name: 'Response'

    scalar :order_id, node_name: 'OrderID'
    scalar :status
    scalar :error_message
  end
end
