require 'rails_helper'

RSpec.describe Map, type: :model do
  before do
    @map = FactoryBot.build(:map)
  end
  

  describe 'マップグループ新規登録' do
    context 'マップグループが登録できる時' do

      it "全て存在すれば登録できること" do
        expect(@map).to be_valid
      end

      it 'imageが空でも保存できること' do
        @map.image = nil
        expect(@map).to be_valid
      end

    end

    context 'マップグループが登録できない時' do

      it "titleが空では登録できないこと" do
        @map.title = nil
        @map.valid?
        expect(@map.errors.full_messages).to include("Title can't be blank")
      end

      it "contentが空では登録できないこと" do
        @map.content = nil
        @map.valid?
        expect(@map.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end
