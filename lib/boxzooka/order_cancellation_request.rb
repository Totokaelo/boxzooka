module Boxzooka
  # Request type for the OrderCancellation endpoint.
  class OrderCancellationRequest < BaseRequest
    root node_name: 'OrderCancellation'

    collection :order_ids,
      flat: true,
      entry_node_name: 'OrderID',
      entry_field_type: :scalar,
      entry_type: :string

    # 'Y’ or ‘N’. If set to ‘Y’, Order record will be archived and removed from most views.
    # If set to ‘N’, or excluded, Order record will remain in most views, marked as canceled.
    scalar :delete
  end
end
