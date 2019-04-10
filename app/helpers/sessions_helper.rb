module SessionsHelper
   # Logs in the given user.
   def log_in(user)
      session[:user_id] = user.id
   end

   def current_user
      if session[:user_id]
         @current_user ||= User.find_by(id: session[:user_id])
      end
   end

   def logged_in?
      !current_user.nil?
   end

   def is_user(id)
      return @current_user.id.to_s == id.to_s
   end

   def is_admin?
      current_user && current_user[:admin]
   end

   def log_out
      session.delete(:user_id)
      @current_user = nil
   end
end
