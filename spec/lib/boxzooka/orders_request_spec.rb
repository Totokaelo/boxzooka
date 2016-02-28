require 'spec_helper'

describe Boxzooka::OrdersRequest do
  let(:address) {
    Boxzooka::Address.new(
      first_name: 'Quinton',
      last_name: 'Harris',
      company: 'Totokaelo',
      address1: '1523 10th Ave',
      city: 'Seattle',
      province: 'WA',
      country_code: 'US',
      phone: '1 (844) 868-6523',
      email: 'quinton@totokaelo.com',
      tax_id: 'ABC123456'
    )
  }

  let(:item) {
    Boxzooka::OrderItem.new(
      description: 'A Cool Black Hat',
      product_url: 'http://totokaelo.com',
      quantity: 1,
      short_description: 'Hat',
      sku: 'ABC123',
      unit_value: 500.00,
      unit_weight: 2.0,
      weight_unit: 'LBS'
    )
  }

  let(:order) {
    Boxzooka::Order.new(
      cancel_date: DateTime.new(2022, 9, 1),
      carrier: 'Fedex',
      carrier_account_no: '#666',
      carrier_method: 'PRIORITY',
      customs_description: 'Wool Hat',
      incoterms: 'DDP',
      items: [item],
      label_note: 'Fragile',
      method: 'INTL_PRIORITY_2DAY',
      order_currency: 'USD',
      order_date: DateTime.new(2016, 2, 16),
      order_id: 'TKTESTO0001',
      order_value: 500.00,
      ship_to: address,
      slip_note: 'Here, have a hat!'
    )
  }

  let(:instance) {
    described_class.new(
      customer_access: Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc'),
      orders: [order]
    )
  }

  describe 'XML serialization' do
    let(:xml) { Boxzooka::Xml.serialize(instance) }
    it { puts Ox.dump(Ox.parse(xml)) }
  end
end
