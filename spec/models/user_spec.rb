require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
          expect(@user).to be_valid
        end
      end

      context '新規登録できないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nicknameを入力してください")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end
        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end
        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
      end
    end
  end
end
