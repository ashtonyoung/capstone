FactoryBot.define do
  factory :user do
    hostnames = %w[gmail outlook yahoo]

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    handle { (first_name + last_name + Faker::Number.digit).downcase }
    password { Faker::Internet.password }
    email { "#{handle}@#{hostnames.sample}.com".downcase }
  end
end
