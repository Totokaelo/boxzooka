require 'spec_helper'

describe Boxzooka::OrdersRequest, :requests do
  let(:response) { boxzooka_endpoint.execute(request) }
  let(:request) { Boxzooka::OrdersRequest.new }

  let(:order) {
    FactoryGirl.build(
      :order,
      order_id: 'TKTEST-OREQ-WITH-SALE-ITEM',
      order_value: items.map(&:unit_value).reduce(0, :+),
      items: items
    )
  }

  it { expect(response.class).to be(Boxzooka::OrdersResponse) }

  context 'sale orders' do
    let(:sale_item) { FactoryGirl.build(:order_item, item_discount: 25) }
    let(:final_sale_item) {
      FactoryGirl.build(
        :order_item,
        attributes: [Boxzooka::Attribute.new(name: 'FinalSale', value: 'TRUE')],
        item_discount: 80
      )
    }
    let(:full_price_item) { FactoryGirl.build(:order_item) }
    let(:items) { [sale_item, final_sale_item, full_price_item] }

    let(:request) {
      Boxzooka::OrdersRequest.new(
        orders: [order]
      )
    }

    it { expect(response.class).to be(Boxzooka::OrdersResponse) }
  end
end
