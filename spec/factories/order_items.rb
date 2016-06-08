FactoryGirl.define do
  factory :order_item, class: Boxzooka::OrderItem do
    description 'Super cool hat'
    item_discount 0.0
    quantity 1
    short_description 'Hat'
    sequence(:sku) { |i| "TKTEST-ORDER-ITEM-#{i}" }
    unit_value 100.00
    unit_weight 2.0
    weight_unit 'LBS'
  end
end
