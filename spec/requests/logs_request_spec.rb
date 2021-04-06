require 'rails_helper'

RSpec.describe "Logs", type: :request do  
  before do
    @user = create(:user)
  end
  let(:score) { create(:score, user_id: @user[:id]) }
  let(:log) { create(:log, score_id: score.id) }

  describe "GET logs#index" do
    it "リクエストに成功すること" do
      sign_in @user
      get logs_path
      expect(response).to have_http_status(200)
    end
  end
end