FactoryBot.define do
  factory :map_user do
    association :map
    association :user
  end
end
