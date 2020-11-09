require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '入力欄全てが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに＠が含まれていないと登録できない' do
      @user.email = 'aaa123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが英数字混合だが、字数が5文字以下であれば登録できない' do
      @user.password = 'aa123'
      @user.password_confirmation = 'aaa123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが平仮名だと保存できない' do
      @user.password = 'あああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英字だけだと保存できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが数字だけだと保存できない' do
      @user.password = '123123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '生年月日が空欄では保存されない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '本名（苗字）が全角でないと保存できない' do
      @user.las_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Las name is invalid')
    end

    it '本名（苗字）が空では保存できない' do
      @user.las_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Las name is invalid')
    end

    it '本名（名前）が全角でないと保存できない' do
      @user.fir_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Fir name is invalid')
    end

    it '本名（名前）が空では保存できない' do
      @user.fir_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Fir name is invalid')
    end

    it '本名(苗字）のフリガナが全角片仮名でないと保存できない' do
      @user.las_name_r = 'あいう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Las name r is invalid')
    end

    it '本名(苗字）のフリガナが空では保存できない' do
      @user.las_name_r = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Las name r is invalid')
    end

    it '本名(名前）のフリガナが全角片仮名でないと保存できない' do
      @user.fir_name_r = 'あいう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Fir name r is invalid')
    end

    it '本名(名前）のフリガナが空では保存できない' do
      @user.fir_name_r = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Fir name r is invalid')
    end
  end
end
