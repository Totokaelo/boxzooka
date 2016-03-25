require 'spec_helper'

describe Boxzooka::Endpoint do
  let(:customer_id) { ENV['BOXZOOKA_CUSTOMER_ID'] }
  let(:customer_key) { ENV['BOXZOOKA_CUSTOMER_KEY'] }

  let(:hostname) { 'sandbox3.boxzooka.com' }
  let(:urls) {
    {
      'CatalogRequest'                  => 'https://sandbox3.boxzooka.com/productsapi',
      'ProductListRequest'              => 'https://sandbox3.boxzooka.com/productlistapi',
      'InboundRequest'                  => 'https://sandbox3.boxzooka.com/inboundapi',
      'InboundCancellationRequest'      => 'https://sandbox3.boxzooka.com/inboundcancelapi',
      'InboundListRequest'              => 'https://sandbox3.boxzooka.com/inboundlistapi',
      'InboundDiscrepancyListRequest'   => 'https://sandbox3.boxzooka.com/inbounddiscrepancyapi',
      'InventoryListRequest'            => 'https://sandbox3.boxzooka.com/inventorylistapi',
      'OrdersRequest'                   => 'https://sandbox3.boxzooka.com/ordersapi',
      'OrderCancellationRequest'        => 'https://sandbox3.boxzooka.com/ordercancelapi',
      'OrdersListRequest'               => 'https://sandbox3.boxzooka.com/orderlistapi',
      'ReturnNotificationRequest'       => 'https://sandbox3.boxzooka.com/returnnotificationapi',
      'InventoryAdjustmentsListRequest' => 'https://sandbox3.boxzooka.com/inventoryadjustmentsapi'
    }
  }

  let(:endpoint) { described_class.new(customer_id: customer_id, customer_key: customer_key, hostname: hostname, debug: true) }
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

  describe 'Orders' do
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
