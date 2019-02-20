class Homecontroller < ApplicationController
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_conf)
  end
  def register

  end
end