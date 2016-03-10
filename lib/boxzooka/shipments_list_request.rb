require 'boxzooka/list_request'

module Boxzooka
  class ShipmentsListRequest < ListRequest
    root node_name: 'ShipmentsList'

    # Available filters:
    # Sku, Category, TrackingCode, PO, WeightMin, WeightMax,
    # FirstName, LastName, Address1, Address2, Address3, City, Province, PostalCode, CountryCode
    # Phone, Email, OrderValueMin, OrderValueMax, DateFrom, DateTo, OrderDateFrom, OrderDateTo,
    # WarehouseID, Status
  end
end
