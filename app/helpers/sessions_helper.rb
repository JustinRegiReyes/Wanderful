module SessionsHelper

   def login(user)
      session[:user_id] = user.id
      @current_user = user
   end

   def current_user
      @current_user = @current_user ||= User.find_by_id(session[:user_id])
   end

   def logged_in?
      if current_user == nil
         redirect_to "/sessions/new"
      end
   end

   def logout
      @curent_user = session[:user_id] = nil
   end
end
