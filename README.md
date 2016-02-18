# Boxzooka API Client

We currently have two APIs to play with: the "fulfillment" API and the "checkout" API. Not quite sure what to tackle first, but this is a list of the existing calls. Most summaries are copypasta from their documentation so forgive the sudden perspective shifts.

## Fulfillment API

### Calls "originating from Client"

- Catalog – for populating metadata on Boxzooka's side.
 
- ProductList – The ProductList data set is used to request a detailed list of your products from our system. This data set is only available through our API, and is limited to 300 products per request.

- Inbound – The Inbound data set is used to send notifications to our system of product inventory that you’re sending to our warehouse.

- InboundCancellation – the InboundCancellation data set is used to cancel existing inbound notifications within our system. Cancellation requests can only be made through our API endpoints via XML.

- InboundList – The InboundList data set is used to list existing inbound notifications within our system. InboundList requests can only be made through our API endpoint via XML. Results are limited to 300.

- InboundDiscrepancy – The InboundDiscrepancy data set is used by Boxzooka to provide you with information about discrepancies between what your Inbound notifications declared, and what we actually received. This data set is sent to you once per week at minimum, or more frequently if needed. is this a webservice call? doesn't look like it

- InboundDiscrepancyList – The InboundDiscrepancyList data set is used to list existing inbound notifications within our system. InboundDiscrepancyList requests can only be made through our API endpoint via XML. Results are limited to 300.

- Orders – The Orders data set is used to instruct our warehouse concerning product orders that require fulfillment... oh god...

- OrderCancellation – The OrderCancellation data set is used to instruct our warehouse concerning orders that need to be canceled. Only orders that are not currently in transit can be canceled. Cancellation requests can only be made through our API endpoints via XML.

- OrdersList – The OrdersList data set is used to list existing orders within our system. OrdersList requests can only be made through our API endpoint via XML. Results are limited to 300.

- ReturnsNotification – The ReturnsNotification data set is used to instruct our warehouse concerning incoming returns.

## Calls "originating from Boxzooka"

> I think for here, only the "*List" requests work... Need to ask Boxzooka if they hit our servers or wait for us to poll.

- Shipments – The Shipments data set is used by Boxzooka to send you confirmations of the shipments we send each day on your behalf. Each shipment record corresponds to an order record that you have sent us earlier in the Orders data set.

- ShipmentsList – The ShipmentsList data set is used to list existing shipments within our system. ShipmentsList requests can only be made through our API endpoint via XML. Results are limited to 300.

- Inventory – The Inventory data set is used by Boxzooka to inform you of your current product inventory in our warehouses. This data set is sent at a minimum of once per day, and more often if needed.

- InventoryList – The InventoryList data set is used to request your list of inventory within our warehouses. InventoryList requests can only be made through our API endpoint via XML. Results are limited to 300.

- InventoryAdjustments – The InventoryAdjustments data set is used by Boxzooka to provide you with detailed records of when/how/why adjustments were made to your inventory within our warehouses. This data set is sent at a minimum of once per day, and more often if needed.

- InventoryAdjustmentsList – The InventoryAdjustmentsList data set is used to request your list of inventory adjustments within our warehouses. InventoryAdjustmentsList requests can only be made through our API endpoint via XML. Results are limited to 300.

- Returns – The Returns data set is used by Boxzooka to send you confirmations and notifications of returns, including any updated information and status. Some of these returns will have been created by you, and some will have been created by us through communications with our carrier partners.

- ReturnsList – The ReturnsList data set is used by you to request your list of returns within our system. ReturnsList requests can only be made through our API endpoint via XML. Results are limited to 300.

- ShipmentBilling – The ShipmentBilling data set is used by Boxzooka to send you detailed information about current shipment billing.

- ShipmentBillingList – The ShipmentBillingList data set is used by you to request a list of shipment billing information from our system. ShipmentBillingList requests can only be made through our API endpoint via XML. Results are limited to 300.
