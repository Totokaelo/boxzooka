require 'boxzooka/shipment_billing_list_response_bill'
require 'boxzooka/base_response'

module Boxzooka
  class ShipmentBillingListResponse < BaseResponse
    collection :results,
      entry_node_name: 'Bill',
      entry_field_type: :entity,
      entry_type: Boxzooka::ShipmentBillingListResponseBill
  end
end
