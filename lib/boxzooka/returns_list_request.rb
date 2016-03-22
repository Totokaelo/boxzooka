require 'boxzooka/list_request'

module Boxzooka
  # List Returns. Limit 300 per Request.
  class ReturnsListRequest < ListRequest
    root node_name: 'ReturnsList'

    # Unique ID of return, assigned by Boxzooka
    filter :return_id, node_name: 'ReturnID'

    # ID of corresponding Order.
    filter :order_id, node_name: 'OrderID'

    # RMA number.
    filter :rma, node_name: 'RMA'

    # Keyword or phrase appearing in Reason field.
    filter :reason_search

    # Keyword or phrase appearing in directive field.
    filter :directive_search

    # Tracking number of return.
    filter :return_tracking

    # Carrier of return.
    filter :return_carrier

    # Minimum estimated return cost.
    filter :return_cost_min

    # Maximum estimated return cost.
    filter :return_cost_max

    # Currency of return cost. Required of ReturnCostMin or Max is specified.
    # Will only find Return costs expressed in this currency.
    filter :return_cost_currency

    # Status of return.
    filter :status

    # Minimum date of when the order data was sent / received
    filter :date_from

    # Maximum date of when the order data was sent / received
    filter :date_to
  end
end
