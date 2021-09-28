require 'rails_helper'

RSpec.describe "Mapの削除機能", type: :system do
  before do
    @map_user = FactoryBot.create(:map_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること' do
    # サインインする
    sign_in(@map_user.user)

    # 作成されたチャットルームへ遷移する
    click_on(@map_user.map.title)

    # メッセージ情報を5つDBに追加する
    FactoryBot.create_list(:message, 5, map_id: @map_user.map.id, user_id: @map_user.user.id)
    # 「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを確認する
    expect {
      find_link("チャットを終了する",  href: map_path(@map_user.map)).click
    }.to change { @map_user.map.messages.count }.by(-5)
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
end
