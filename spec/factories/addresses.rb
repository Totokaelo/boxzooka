FactoryGirl.define do
  factory :address, class: Boxzooka::Address do
    first_name 'Quinton'
    last_name 'Harris'
    company 'Totokaelo'
    address1 '1523 10th Ave'
    city 'Seattle'
    province 'WA'
    country_code 'US'
    postal_code '98122'
    phone '1 (844) 868-6523'
    email 'quinton@totokaelo.com'
    tax_id 'ABC123456'
  end
end
