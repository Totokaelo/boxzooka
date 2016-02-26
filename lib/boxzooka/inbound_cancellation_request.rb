module Boxzooka
  class InboundCancellationRequest < BaseRequest
    # Purchase order number
    # Per their documentation this may be a flat array, but don't bother including until needed
    #
    scalar :po

    # 'Y’ or ‘N’. If set to ‘Y’, Inbound record will be archived and removed from most views.
    # If set to ‘N’, or excluded, Inbound record will remain in most views, marked as canceled.
    scalar :delete
  end
end
