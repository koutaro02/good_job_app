FactoryBot.define do
  factory :map do
    title { "東京都千代田区丸の内1-9-1" }
    address { "東京都千代田区丸の内1-9-1" }
    latitude { "35.6817" }
    longitude { "139.766" }
    content { "東京駅、上り線上り線（夜間）" }

    after(:build) do |map|
      map.image.attach(io: File.open('public/images/hotcake.png'), filename: 'hotcake.png')
    end
  end
end
