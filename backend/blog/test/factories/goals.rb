FactoryBot.define do
  factory :goal do
    name { "Achieve World Peace" }
    description { "This is not a realistic goal" }
    target_date { Time.now + 90.days }
    status { 0 }
  end
end
