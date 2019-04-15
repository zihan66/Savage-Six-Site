class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        flash[:notice] = "Logged in successfully"
        redirect_to user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:alert] = message
        redirect_to root_url
      end
    else
      # Create an error message.
      flash.now[:alert] = 'Invalid email/password combination'
      puts "did a thing"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
