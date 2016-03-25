module Boxzooka
  class EndpointUrls
    def initialize(hostname)
      @hostname = hostname
    end

    def url_for_request(request)
      "https://#{@hostname}/#{pathname_for_request(request)}"
    end

    private

    def pathname_for_request(request)
      case request
      when CatalogRequest                   then 'productsapi'

      when InboundRequest                   then 'inboundapi'
      when InboundCancellationRequest       then 'inboundcancelapi'
      when InboundDiscrepancyListRequest    then 'inbounddiscrepancyapi'
      when InboundListRequest               then 'inboundlistapi'

      when InventoryAdjustmentsListRequest  then 'inventoryadjustmentlistapi'
      when InventoryListRequest             then 'inventorylistapi'

      when OrdersRequest                    then 'ordersapi'
      when OrderCancellationRequest         then 'ordercancelapi'
      when OrdersListRequest                then 'orderlistapi'

      when ProductListRequest               then 'productlistapi'

      when ReturnNotificationRequest        then 'returnnotificationapi'
      when ReturnsListRequest               then 'returnslistapi'

      when ShipmentBillingListRequest       then 'shipmentbillinglistapi'
      when ShipmentsListRequest             then 'shipmentlistapi'
      else
        raise NotImplementedError
      end
    end
  end
end
