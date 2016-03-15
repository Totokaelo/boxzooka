# Boxzooka API Client

Are you a fashionable retailer with boxes overflowing out of your stock room? Are YOU ready to start paying someone else to be responsible for picking the black hoodie versus the charcoal one? Then this gem's for you.

### Usage

Construct an endpoint.
```
endpoint = Boxzooka::Endpoint.new(
  customer_id: 'ABC123', customer_key: 'XXXXXX', 
  urls: { 'ProductListRequest'  => 'https://sandbox3.boxzooka.com/productlistapi' }
)
```
Construct a request and send it off.
```
filter   = Boxzooka::ListFilter.new(filter_type: 'DescriptionSearch', filter_value: 'Socks')
request  = Boxzooka::ProductListRequest.new(filters: [filter])
response = endpoint.execute(request)
```
Do something useful with the response!
```
results = response.results
puts "I have #{results.length} socks!"
```

### Class Structure.

Namespace is flat under `Boxzooka::`. Almost all classes inherit of `Boxzooka::BaseElement` which has some tools to quickly define fields for XML serialization/deserialization.

All requests inherit from `Boxzooka::BaseRequest`. 
All responses inherit from `Boxzooka::BaseResponse`.

### Request / Response Pairs.

#### [Boxzooka::CatalogRequest](lib/boxzooka/catalog_request.rb) / [Boxzooka::CatalogResponse](lib/boxzooka/catalog_response.rb)

Populate Boxzooka's database with item metadata.

#### [Boxzooka::ProductListRequest](lib/boxzooka/product_list_request.rb) / [Boxzooka::ProductListResponse] (lib/boxzooka/product_list_response.rb)

Query item metadata.

### [Boxzooka::InventoryAdjustmentsRequest](lib/boxzooka/inventory_adjustments_request.rb) / [Boxzooka::InventoryAdjustmentsResponse](lib/boxzooka/inventory_adjustments_response.rb)

List of adjustments performed by Boxzooka.

#### [Boxzooka::InventoryListRequest](lib/boxzooka/inventory_list_request.rb) / [Boxzooka::InventoryListResponse](lib/boxzooka/inventory_list_response.rb)

Query item inventory.

#### [Boxzooka::OrdersRequest](lib/boxzooka/orders_request.rb) / [Boxzooka::OrdersResponse](lib/boxzooka/orders_response.rb)

Inform Boxzooka to ship an Order.

#### [Boxzooka::OrdersListRequest](lib/boxzooka/orders_list_request.rb) / [Boxzooka::OrdersListResponse](lib/boxzooka/orders_list_response.rb)

Query Order status.

#### [Boxzooka::ShipmentsListRequest](lib/boxzooka/shipments_list_request.rb) / [Boxzooka::ShipmentsListResponse](lib/boxzooka/shipments_list_response.rb)

Query Shipment status.

## TODO

InboundRequest, InboundCancellationRequest, InboundListRequest, InboundDiscrepancyListRequest, ReturnsNotificationRequest

- Shipments – The Shipments data set is used by Boxzooka to send you confirmations of the shipments we send each day on your behalf. Each shipment record corresponds to an order record that you have sent us earlier in the Orders data set.

- InventoryAdjustments – The InventoryAdjustments data set is used by Boxzooka to provide you with detailed records of when/how/why adjustments were made to your inventory within our warehouses. This data set is sent at a minimum of once per day, and more often if needed.

- Returns – The Returns data set is used by Boxzooka to send you confirmations and notifications of returns, including any updated information and status. Some of these returns will have been created by you, and some will have been created by us through communications with our carrier partners.

- ReturnsList – The ReturnsList data set is used by you to request your list of returns within our system. ReturnsList requests can only be made through our API endpoint via XML. Results are limited to 300.

- ShipmentBilling – The ShipmentBilling data set is used by Boxzooka to send you detailed information about current shipment billing.

- ShipmentBillingList – The ShipmentBillingList data set is used by you to request a list of shipment billing information from our system. ShipmentBillingList requests can only be made through our API endpoint via XML. Results are limited to 300.
