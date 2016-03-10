require 'spec_helper'

describe Boxzooka::Endpoint do
  let(:customer_id) { ENV['BOXZOOKA_CUSTOMER_ID'] }
  let(:customer_key) { ENV['BOXZOOKA_CUSTOMER_KEY'] }

  let(:endpoint) { described_class.new(customer_id: customer_id, customer_key: customer_key) }
  let(:response)  { endpoint.execute(request) }

  describe 'Catalog' do
    let(:item1) { FactoryGirl.build(:item) }
    let(:item2) { nil }

    let(:request) { Boxzooka::CatalogRequest.new(items: [item1]) }

    it 'XML should be populated' do
      expect(response.xml).to_not be_nil
    end
  end

  describe 'ProductList' do
    let(:request)   { Boxzooka::ProductListRequest.new }

    it 'XML should be populated' do
      expect(response.xml).to_not be_nil
    end

    it 'should have results' do
      expect(response.results).to_not be_nil
      expect(response.results).to_not be_empty
    end
  end

  describe 'InventoryList' do
    let(:request) { Boxzooka::InventoryListRequest.new }

    it 'XML should be populated' do
      puts response.xml
      expect(response.xml).to_not be_nil
    end

    it 'should have results' do
      expect(response.results).to_not be_nil
      expect(response.results).to_not be_empty
    end
  end
end
