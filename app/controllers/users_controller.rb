class UsersController < ApplicationController
def user_params
  params.require(:user).permit(:name, :email, :password,
                               :password_confirmation)
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