FactoryGirl.define do
  factory :item, class: Boxzooka::Item do
    sku 'QTEST001'

    brand_or_manufacturer 'Dries van Noten'
    currency_code 'USD'
    category 'Coats and Jackets'
    color 'Black'
    country_of_origin 'IT'
    declared_customs_value 5000.00
    description 'A black jacket'
    dim_height 50
    dim_width 40
    dim_length 5
    dim_unit 'IN'
    item_name 'Black Jacket'
    item_url 'http://dries-van-noten.com/black-jacket'
    materials 'Leather, Polyamide'
    short_description 'Black leather jacket'
    size 'Large'
    ucc 333333333333
    upc_vendor_barcode 222222222222
    weight 3.12
    weight_unit 'LBS'
  end
end
