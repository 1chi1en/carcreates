require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "ユーザー情報がきちんと入力されていれば登録できる" do
    expect(@user).to be_valid
    end

    end
  end

end
