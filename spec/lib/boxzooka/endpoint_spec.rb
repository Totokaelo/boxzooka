require 'spec_helper'

describe Boxzooka::Endpoint do
  let(:endpoint) { boxzooka_endpoint }
  let(:response)  { endpoint.execute(request) }

  describe 'Catalog' do
    let(:item1) { FactoryGirl.build(:item) }
    let(:item2) { nil }

    let(:request) { Boxzooka::CatalogRequest.new(items: [item1]) }

    it { expect(response.class).to be(Boxzooka::CatalogResponse) }
    it { expect(response.xml).to_not be_nil }
    it { expect(response.http_response).to_not be_nil }
    it { expect(response.request).to_not be_nil }
  end

  describe 'ProductList' do
    let(:request)   { Boxzooka::ProductListRequest.new_with_filters(filters: { sku: '510105' }) }

    it { expect(response.class).to be(Boxzooka::ProductListResponse) }

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

    it { expect(response.class).to be(Boxzooka::InventoryListResponse) }

    it 'XML should be populated' do
      puts response.xml
      expect(response.xml).to_not be_nil
    end

    it 'should have results' do
      expect(response.results).to_not be_nil
      expect(response.results).to_not be_empty
    end
  end

  describe 'Create Orders' do
    let(:request) { Boxzooka::OrdersRequest.new }

    it { expect(response.class).to be(Boxzooka::OrdersResponse) }
  end

  describe 'OrdersList' do
    let(:request) { Boxzooka::OrdersListRequest.new }

    it { expect(response.class).to be(Boxzooka::OrdersListResponse) }

    # We'll need some Orders in the Boxzooka db before this will return anything!
  end

  describe 'InventoryAdjustmentsList' do
    let(:request) { Boxzooka::InventoryAdjustmentsListRequest.new }

    it { expect(response.class).to be(Boxzooka::InventoryAdjustmentsListResponse) }

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
