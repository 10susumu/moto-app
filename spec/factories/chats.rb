FactoryBot.define do
  factory :chat do
    master_user_id { 1 }
    user_id { 2 }
    text { Faker::Lorem.sentence }
  end
end
