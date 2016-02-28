require 'boxzooka/return_notification'

module Boxzooka
  class ReturnsNotificationRequest < BaseRequest
    collection :returns,
      flat: true,
      entry_field_type: :entity,
      entry_type: Boxzooka::ReturnNotification,
      entry_node_name: 'Return'
  end
end
