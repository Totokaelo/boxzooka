require 'spec_helper'

describe Boxzooka::ProductListRequest do
  let(:instance) {
    described_class.new(
      customer_access: Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc'),
      filter: Boxzooka::ProductListFilter.new(filter_type: 'Description', filter_value: 'Stocks'),
      order_by: 'Description',
      sort: 'ASC',
      skip_count: 300
    )
  }

  describe 'XML serialization' do
    let(:xml) { Boxzooka::Xml.serialize(instance) }
    it { puts Ox.dump(Ox.parse(xml)) }
  end
end
