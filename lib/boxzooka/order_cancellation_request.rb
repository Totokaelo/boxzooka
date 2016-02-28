module Boxzooka
  class OrderCancellationRequest < BaseRequest
    scalar :order_id, node_name: 'OrderID'

    # 'Y’ or ‘N’. If set to ‘Y’, Inbound record will be archived and removed from most views.
    # If set to ‘N’, or excluded, Inbound record will remain in most views, marked as canceled.
    scalar :delete
  end
end
