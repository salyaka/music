require 'rails_helper'

RSpec.describe Score, type: :model do
  describe "バリデーション" do
    subject { score.valid? }

    context "titleが空のとき" do
      let(:score) { build(:score, title: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(score.errors[:title]).to include "を入力してください"
      end
    end
    
    context "title が51字以上のとき" do
      let(:score) { build(:score, title: "a" * 51) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(score.errors[:title]).to include "は50文字以内で入力してください"
      end
    end

    context "楽譜が削除されたとき" do
      subject { score.destroy }
      let(:score) { create(:score) }
      before do
        create_list(:log, 5, score: score)
        create(:log)
      end
      it "楽譜のログも削除される" do
        expect { subject }.to change { score.logs.count }.by(-5)
      end
    end
  end
end