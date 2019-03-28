class UsersController < ApplicationController
  def index
    @users = User.search(params[:search])
  end

  def show
    if !logged_in?
      redirect_to login_path
    else
      @user = User.find(params[:id])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Savage Six Site!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    #if @user.update_attributes(user_params)
     # flash[:success] = "Profile updated"
     # redirect_to @user
    #else
      #render 'edit'
    #end
    end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
     params.require(:user).permit(:FirstName, :lastname, :email, :password,
                                     :password_confirmation, :major, :classyear, :occupation, :phonenumber, :city,
                                      :state, :country, :search)
  end
end
