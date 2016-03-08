require 'boxzooka/return_notification_item'

module Boxzooka
  class ReturnNotification < BaseElement
    # Unique order ID.
    scalar :order_id, node_name: 'OrderID'

    # Date/Time that the return was created.
    scalar :return_date, type: :datetime

    # RMA used to identify return
    scalar :rma,
      node_name: 'RMA'

    # Tracking number of package
    scalar :return_tracking

    # Carrier of package
    scalar :return_carrier

    # Additional Notes
    scalar :notes

    collection :items,
      entry_field_type: :entity,
      entry_type: Boxzooka::ReturnNotificationItem,
      entry_node_name: 'Item'
  end
end
