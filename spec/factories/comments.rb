FactoryBot.define do
  factory :comment do
    user_id { 1 }
    content_id { 1 }
    text { Faker::Lorem.sentence }
  end
end
