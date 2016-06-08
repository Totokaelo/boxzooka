FactoryGirl.define do
  factory :order, class: Boxzooka::Order do
    cancel_date DateTime.new(2022, 9, 1)
    carrier 'Fedex'
    carrier_account_no '666'
    carrier_method 'PRIORITY'
    customs_description 'Some Items'
    incoterms 'DDP'
    items { build_list(:order_item, 1) }
    label_note 'Fragile'
    order_currency 'USD'
    order_date DateTime.new(2016, 2, 16)
    sequence(:order_id) { |i| "TKTEST-ORDER-#{i}" }
    order_value 500.00
    ship_to FactoryGirl.build(:address)
    slip_note 'Factorygirl'
  end
end
