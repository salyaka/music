require 'rails_helper'

RSpec.describe Log, type: :model do
  describe "バリデーション" do
    subject { log.valid? }

    context "contentが空のとき" do
      let(:log) { build(:log, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(log.errors[:content]).to include "を入力してください"
      end
    end

    context "contentが200文字以上のとき" do
      let(:log) { build(:log, content: "あ" * 201) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(log.errors[:content]).to include "は200文字以内で入力してください"
      end
    end

    context "start_time" do
      let(:log) { build(:log, start_time: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(log.errors[:start_time]).to include "を入力してください"
      end
    end

    context "start_time" do
      let(:log) { build(:log, start_time: Date.today + 1) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(log.errors[:start_time]).to include "未来の日付は登録できません"
      end
    end

  end
end