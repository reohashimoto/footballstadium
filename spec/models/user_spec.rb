require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全て情報が正しく入力されていれば登録できる" do
    expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
      it "メールアドレスに@が含まれてない場合登録できない" do
        @user.email = "ohaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが半角英字のみの場合登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end
    it "パスワードが半角数字のみの場合登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end

    it "パスワードが全角英数字の場合登録できない" do
      @user.password = "A１A１A１"
      @user.password_confirmation = "A１A１A１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end
      
    it "passwordが6文字以上のでないと登録できないこと" do
      @user.password = "a0a0a"
      @user.password_confirmation = "a0a0a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードと確認用のパスワードが一致しないと登録できない" do
      @user.password = "1a3a56"
      @user.password_confirmation = "1a3a567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "好きなチームが空だと登録できない" do
      @user.favorite_team = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Favorite team can't be blank")
    end

    it "好きな選手が空だと登録できない" do
      @user.favorite_player = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Favorite player can't be blank")
    end

    it "誕生日が空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
