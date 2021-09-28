require 'rails_helper'

RSpec.describe "Userのログイン機能", type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    visit root_path
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し、トップページに遷移する' do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    expect(current_path).to eq new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on('Log in')
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    @user = FactoryBot.create(:user)
    visit root_path
    expect(current_path).to eq new_user_session_path
    fill_in 'Email',with: "12345"
    fill_in 'Password',with: "123456"
    click_on('Log in')
    expect(current_path).to eq new_user_session_path
  end
end
