require 'spec_helper'

describe Boxzooka::InboundDiscrepancyListRequest do
  let(:instance) {
    described_class.new(
      customer_access: Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc')
    )
  }

  describe 'XML serialization' do
    let(:xml) { puts "yo insatnce #{instance}"; Boxzooka::Xml.serialize(instance) }
    it { puts Ox.dump(Ox.parse(xml)) }
  end
end
