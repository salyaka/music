require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, email: "") }
  
  describe "POST #create" do
    it "アカウントの作成に成功すること" do
      expect do
        post user_registration_path, params: { user: user_params }
      end.to change(User, :count).by 1
    end
  end
end