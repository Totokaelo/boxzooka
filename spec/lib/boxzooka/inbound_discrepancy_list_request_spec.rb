require 'spec_helper'

describe Boxzooka::InboundDiscrepancyListRequest do
  let(:instance) {
    described_class.new(
      customer_access: Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc'),
      filters: [described_class.filter(filter_type: 'Sku', filter_value: '123456')]
    )
  }

  describe 'XML serialization' do
    let(:xml) { Boxzooka::Xml.serialize(instance) }
    it { puts Ox.dump(Ox.parse(xml)) }
  end
end
