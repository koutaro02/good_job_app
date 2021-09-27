require 'rails_helper'

RSpec.describe Message, type: :model do
    before do
      @message = FactoryBot.build(:message)
    end

  describe 'メッセージの登録' do
    context '登録できる時' do

      it 'commentとimageが存在していれば保存できること' do
        expect(@message).to be_valid
      end

      it 'commentが空でも保存できること' do
        @message.comment = nil
        expect(@message).to be_valid
      end

      it 'imageが空でも保存できること' do
        @message.image = nil
        expect(@message).to be_valid
      end

    end

    context '登録できない時' do

      it 'commentとimageが空では保存できないこと' do
        @message.comment = nil
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Comment can't be blank")
      end

      it 'mapが紐付いていないと保存できないこと' do
        @message.map = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Map must exist")
      end

      it 'userが紐付いていないと保存できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end

    end
  end
end
