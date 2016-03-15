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

### Available Requests

#### Boxzooka::CatalogRequest

Use `Boxzooka::CatalogRequest` when you need to populate Boxzooka's database with item metadata.

#### Boxzooka::ProductListRequest

Use `Boxzooka::ProductList` when you need to query item metadata.

#### Boxzooka::InventoryListRequest

Use `Boxzooka::InventoryListRequest` when you need to query item inventory.

#### Boxzooka::OrdersRequest

Use `Boxzooka::OrdersRequest` to inform Boxzooka to ship an Order.

#### Boxzooka::OrdersListRequest

Use `Boxzooka::OrdersListRequest` when you need to query Order status.

#### Boxzooka::ShipmentsListRequest

Use `Boxzooka::ShipmentsListRequest` when you need to query Shipment status.

## TODO

InboundRequest, InboundCancellationRequest, InboundListRequest, InboundDiscrepancyListRequest, ReturnsNotificationRequest

- Shipments – The Shipments data set is used by Boxzooka to send you confirmations of the shipments we send each day on your behalf. Each shipment record corresponds to an order record that you have sent us earlier in the Orders data set.

- InventoryAdjustments – The InventoryAdjustments data set is used by Boxzooka to provide you with detailed records of when/how/why adjustments were made to your inventory within our warehouses. This data set is sent at a minimum of once per day, and more often if needed.

- InventoryAdjustmentsList – The InventoryAdjustmentsList data set is used to request your list of inventory adjustments within our warehouses. InventoryAdjustmentsList requests can only be made through our API endpoint via XML. Results are limited to 300.

- Returns – The Returns data set is used by Boxzooka to send you confirmations and notifications of returns, including any updated information and status. Some of these returns will have been created by you, and some will have been created by us through communications with our carrier partners.

- ReturnsList – The ReturnsList data set is used by you to request your list of returns within our system. ReturnsList requests can only be made through our API endpoint via XML. Results are limited to 300.

- ShipmentBilling – The ShipmentBilling data set is used by Boxzooka to send you detailed information about current shipment billing.

- ShipmentBillingList – The ShipmentBillingList data set is used by you to request a list of shipment billing information from our system. ShipmentBillingList requests can only be made through our API endpoint via XML. Results are limited to 300.
