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
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Savage Six Site!"
      redirect_to @user
    else
      render 'new'
    end
  end

end