FactoryBot.define do
  factory :message do
    comment {Faker::Lorem.sentence}
    association :user
    association :map

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
