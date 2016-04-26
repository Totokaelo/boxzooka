require 'spec_helper'

describe Boxzooka::InboundRequest, :requests do
  before(:all) do
    # Sync Metadata
    item1 = FactoryGirl.build(
      :item,
      sku: 'INBOUND-TEST-ITEM1',
      item_name: 'Moto Jacket'
    )

    catalog_request = Boxzooka::CatalogRequest.new(items: [item1])
    boxzooka_endpoint.execute(catalog_request)
  end

  let(:response) { boxzooka_endpoint.execute(request) }
  let(:request) do
    Boxzooka::InboundRequest.new(
      po: "TK-TEST-INBOUND-1",
      items: inbound_items,
      carrier: 'FEDEX',

      estimated_delivery_date: '2016-04-22',
      ship_date: '2016-04-20',

      tracking_code: 'TK-TEST-INBOUND-TRACKING-CODE',
      container_id: 'TK-TEST-INBOUND-CONTAINER-1'
    )
  end

  let(:items) { [item1, item2] }
  let(:inbound_items) { [inbound_item_1] }

  let(:inbound_item_1) do
    Boxzooka::InboundRequestItem.new(
      sku: item1.sku,
      quantity: 10,
      description: 'A Jacket - Unique Description on the Inbound Item',
      short_description: 'A Jacket',
      upc_vendor_barcode: '111122223333'
    )
  end

  let(:item1) do
    FactoryGirl.build(
      :item,
      sku: 'INBOUND-TEST-ITEM1',
      item_name: 'Moto Jacket'
    )
  end

  let(:item2) do
    FactoryGirl.build(
      :item,
      sku: 'INBOUND-TEST-ITEM2',
      item_name: 'Moto Jacket II'
    )
  end

  it 'should work' do
    expect(response.success?).to be(true)
  end
end
