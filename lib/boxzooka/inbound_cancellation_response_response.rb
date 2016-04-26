module Boxzooka
  # 'Response' item on InboundCancellationResponse.
  class InboundCancellationResponseResponse < BaseElement
    scalar :po, node_name: 'PO'
    scalar :status
    scalar :error_message

    def success?
      status == 'Success'
    end
  end
end
