FactoryBot.define do
  factory :buyer_address do
    postal_code       {'123-4567'}
    prefecture_id     { 1 }
    city              {'大阪市'}
    address           {'中央区'}
    phone_number      {'09012345678'}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
