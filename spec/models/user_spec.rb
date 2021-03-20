require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    subject { user.valid? }

    context "emailが空のとき" do
      let(:user) { build(:user, email: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors[:email]).to include "を入力してください"
      end
    end

    context "emailが重複したとき" do
      it "エラーが発生する" do
        email = Faker::Internet.email
        user = create(:user, email: email)
        other_user = build(:user, email: email)
        expect(other_user.valid?).to eq false
        expect(other_user.errors[:email]).to include "はすでに存在します"
      end
    end

    context "passwordが空のとき" do
      let(:user) { build(:user, password: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors[:password]).to include "を入力してください"
      end
    end
    
    context "passwordが6文字以上のとき" do
      let(:user) { build(:user, password: "a" * 6, password_confirmation: "a" * 6) }
      it "登録できる" do
        expect(subject).to eq true
      end
    end

    context "ユーザーが削除されたとき" do
      subject { user.destroy }
      let(:user) { create(:user) }
      before do
        create_list(:score, 2, user: user)
        create(:score)
      end
      it "そのユーザーの楽譜も削除される" do
        expect { subject }.to change { user.score.count }.by(-2)
      end
    end

  end
end