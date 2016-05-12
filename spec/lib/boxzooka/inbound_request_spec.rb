require 'spec_helper'

describe Boxzooka::InboundRequest do
  let(:item) {
    Boxzooka::InboundRequestItem.new(sku: 'ITEM001', description: 'Cool black hat', quantity: 5, upc_vendor_barcode: 'ABX-123-555-YY')
  }

  let(:item_b) {
    Boxzooka::InboundRequestItem.new(sku: 'ITEM002', description: 'Cool white hat', quantity: 10, upc_vendor_barcode: 'ABX-123-555-XX')
  }

  let(:instance) {
    described_class.new(
      customer_access: Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc'),
      po: 123456789,
      container_id: 987654321,
      carrier: 'Fedex',
      tracking_code: 'ABCDE12345',
      ship_date: DateTime.new(2016, 2, 16),
      estimated_delivery_date: DateTime.new(2016, 2, 18),
      items: [item, item_b]
    )
  }

  describe 'XML serialization' do
    let(:xml) { Boxzooka::Xml.serialize(instance) }
    it { puts Ox.dump(Ox.parse(xml)) }
  end
end
