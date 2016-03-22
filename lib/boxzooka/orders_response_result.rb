module Boxzooka
  class OrdersResponseResult < BaseElement
    scalar :order_id,
      node_name: 'OrderID'

    scalar :status

    collection :error_messages,
      flat: :true,
      entry_node_name: 'ErrorMessage',
      entry_field_type: :scalar,
      entry_type: :string

    def success?
      status == 'Success'
    end

    def error?
      status == 'Error'
    end
  end
end
