class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:FirstName, :lastname, :email, :password,
                                 :password_confirmation, :major, :classyear, :occupation, :phonenumber, :city,
                                  :state, :country)
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    debugger
  end

  def new
  end

  def create
    @user = User.create!(user_params)
  end

end