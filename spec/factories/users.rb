FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                {Faker::Name.initials(number: 5)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    first_name              {person.first}
    last_name               {person.last}
    first_name_kana         {person.first.katakana}
    last_name_kana          {person.last.katakana}
    birth_day               {Faker::Date.backward}
  end
end