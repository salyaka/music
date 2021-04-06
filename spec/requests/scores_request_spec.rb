require 'rails_helper'

RSpec.describe "Scores", type: :request do  
  before do
    @user = create(:user)
  end
  let(:score) { create(:score, user_id: @user[:id]) }
  let(:score_id) { score.id }

  describe "GET scores#index" do
    subject { get scores_path }
    it "リクエストに成功する" do
      sign_in @user
      subject
      expect(response).to have_http_status(200)
    end
    it "titleが表示されてる" do
      subject
      expect(response.body).to include(*Score.pluck(:title))
    end
  end
  
  describe "GET scores#show" do
    subject { get score_path(score.id) }
    context "楽譜が存在するとき" do
      it "リクエストが成功する" do
        sign_in @user
        subject
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    subject { post(scores_path, params: params) }
    let(:params) {{ score: attributes_for(:score) }}
    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #destroy" do
    subject { delete score_path(score.id) }
    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(302)
    end
  end
end