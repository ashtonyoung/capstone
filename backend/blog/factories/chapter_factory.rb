FactoryBot.define do
  factory :chapter do
    name { Faker::Book.title }
    description { "A chapter about #{Faker::Hobby.activity}" }
    expiration_date { Faker::Time.between(from: 7.days.from_now, to: 30.days.from_now) }
    sealed { false }
    user
  end
end
