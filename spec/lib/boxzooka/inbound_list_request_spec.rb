require 'spec_helper'

describe Boxzooka::InboundListRequest do
  let(:filter) { described_class.filter(filter_type: 'PO', filter_value: 'ABCDE12345') }

  let(:instance) {
    described_class.new(
      customer_access: Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc'),
      filters: [filter]
    )
  }

  describe 'XML serialization' do
    let(:xml) { Boxzooka::Xml.serialize(instance) }
    it { puts Ox.dump(Ox.parse(xml)) }
  end
end
