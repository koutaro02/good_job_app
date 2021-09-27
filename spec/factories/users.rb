FactoryBot.define do
  factory :user do

    japanese_user = Gimei.name

    family_name { japanese_user.last.kanji }
    last_name { japanese_user.first.kanji  }
    phone_number { "09012345678" }
    company_name { "株式会社ハナコ" }
    position_id { 2 }
    email { "test@com" }
    password { "123taro" }
    password_confirmation { password }
  end
end
