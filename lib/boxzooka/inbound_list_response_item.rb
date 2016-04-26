module Boxzooka
  # 'Item' elements on the InboundListResponse.
  class InboundListResponseItem < Item
    scalar :quantity

    # 'data_received', 'arrived', 'received', 'stocked', 'canceled', 'discrepancy', 'unreconciled'
    scalar :status
  end
end
