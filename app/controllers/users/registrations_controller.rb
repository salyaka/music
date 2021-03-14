class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %[update destroy]

  def check_guest
    if resourcs.email == "guest@example.com"
      redirect_to scores_path, alert: "ゲストユーザーの変更・削除はできません."
    end
  end
end