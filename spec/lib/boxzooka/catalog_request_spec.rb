require 'spec_helper'

describe Boxzooka::CatalogRequest do
  let(:item) {
    FactoryGirl.build(:item)
  }

  let(:catalog_request) {
    cr = Boxzooka::CatalogRequest.new
    cr.customer_access = Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc')
    cr.items = [item]
    cr
  }

  subject { Boxzooka::Xml.serialize(catalog_request) }

  it 'outputs' do
    puts Ox.dump(Ox.parse(subject))
  end
end
