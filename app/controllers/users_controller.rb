class UsersController < ApplicationController
   def index
      if !logged_in?
         redirect_to login_path
         flash[:alert] = "You must be logged in to view profiles.  "
      end
      @users = User.where(activated:true).search(params[:search], params[:filter])

      if @users.length == 0
         flash.now.alert = "No users found."
         @users = User.where(admin: false)
      end
   end

   def show
      if !logged_in?
         redirect_to login_path
         flash[:alert] = "You must be logged in to view profiles.  "
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
         @user.send_activation_email
         flash[:notice] = "Please check your email to activate your account."
         redirect_to root_url
      else
         flash.now[:alert] = @user.errors.full_messages.join("<br/>").html_safe
         render 'new'
      end
   end

   def edit
      if !logged_in?
         redirect_to login_path and return
      elsif !is_user(params[:id])
         redirect_to current_user and return
      end

      @user = User.find(params[:id])
   end

   def update
      params[:user].delete(:password) if params[:user][:password].blank?
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
         flash[:notice] = "Profile updated"
         redirect_to @user
      else
         flash.now[:alert] = @user.errors.full_messages.join("<br/>").html_safe
         render 'edit'
      end
   end

   def password_changed?
      !@password_digest.blank? or password.blank?
   end

   private

   def user_params
      params.require(:user).permit(:FirstName, :lastname, :email, :password,
                                   :password_confirmation, :major, :classyear, :occupation, :phonenumber, :city,
                                   :state, :country, :military,
                                   :state, :country, :search)
   end

end
