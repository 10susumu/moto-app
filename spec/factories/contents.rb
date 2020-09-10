FactoryBot.define do
  factory :content do
    user_id { 1 }
    text { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test.png')) }
    map { Faker::Lorem.sentence }
  end
end
