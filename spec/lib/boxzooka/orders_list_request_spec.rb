require 'spec_helper'

describe Boxzooka::OrdersListRequest do
  let(:date_from) { described_class.new_with_filters(filters: { date_from: '2016-01-01' }) }
  let(:date_to)   { described_class.new_with_filters(filters: { date_to: '2016-02-29' }) }

  let(:instance) {
    described_class.new(
      customer_access: Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc'),
      filters: [date_from, date_to]
    )
  }

  describe 'XML serialization' do
    let(:xml) { Boxzooka::Xml.serialize(instance) }
    it { puts Ox.dump(Ox.parse(xml)) }
  end
end
