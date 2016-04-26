require 'spec_helper'
require 'date'

describe Boxzooka::InboundCancellationRequest, :requests do
  let(:catalog_request) { Boxzooka::CatalogRequest.new(items: [item]) }

  let(:inbound_request) do
    Boxzooka::InboundRequest.new(
      po: inbound_po_name,
      items: [inbound_item],
      carrier: 'FEDEX',

      estimated_delivery_date: DateTime.now + 5,
      ship_date: DateTime.now,

      tracking_code: 'TK-TEST-C-INBOUND-TRACKING-CODE',
      container_id: 'TK-TEST-C-INBOUND-CONTAINER-1'
    )
  end

  let(:inbound_cancellation_request) {
    Boxzooka::InboundCancellationRequest.new(
      po: inbound_po_name
    )
  }

  let(:item) {
    FactoryGirl.build(
      :item,
      sku: 'TK-TEST-C-INBOUND-ITEM1',
      item_name: 'Moto Jacket'
    )
  }

  let(:inbound_item) do
    Boxzooka::InboundRequestItem.new(
      sku: item.sku,
      quantity: 10,
      description: 'Jacket',
      short_description: 'Jacket',
      upc_vendor_barcode: '111122223333'
    )
  end

  let(:inbound_po_name) { "TK-TEST-C-INBOUND-1" }

  it 'should work' do
    catalog_response = boxzooka_endpoint.execute(catalog_request)
    inbound_response = boxzooka_endpoint.execute(inbound_request)

    # expect(catalog_response.success?).to be(true)
    expect(inbound_response.success?).to be(true)

    inbound_cancellation_response = boxzooka_endpoint.execute(inbound_cancellation_request)
    expect(inbound_cancellation_response.success?).to be(true)
  end
end
