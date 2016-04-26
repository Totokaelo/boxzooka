require 'boxzooka/inbound_cancellation_response_response'

module Boxzooka
  # Response to the InboundCancellationRequest.
  class InboundCancellationResponse < BaseResponse
    collection :results,
      entry_field_type: :entity,
      entry_node_name: 'Response',
      entry_type: Boxzooka::InboundCancellationResponseResponse

    def success?
      results.all?(&:success?)
    end
  end
end
