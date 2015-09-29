module SessionsHelper

   def login(user)
      session[:user_id] = user.id
      @current_user = user
   end

   def logged_in?
      if current_user == nil
         redirect_to "login"
      end
   end

   def current_user
      @current_user = @current_user ||= User.find(session[:user_id])
   end

   def logout
      @curent_user = session[:user_id] = nil
   end
end
