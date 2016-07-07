require 'spec_helper'

describe Boxzooka::LandedQuoteRequest do
  let(:request) do
    described_class.new(
      currency: 'USD',
      destination_country_code: 'CN',
      destination_province: 'Shanghai',
      products: products,
      origin_country_code: 'US',
      origin_province: 'CA'
    )
  end

  let(:products) { [Boxzooka::LandedQuoteRequestItem.new(sku: 'ABC123', quantity: 5)] }

  describe 'XML serialization' do
    subject { Boxzooka::Xml.serialize(request) }
    it { puts Ox.dump(Ox.parse(subject)) }
  end
end
