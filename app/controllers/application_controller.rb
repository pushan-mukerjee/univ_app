class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

   #defining helper_method enables all views to use the logged_in functionality
   helper_method :current_user, :logged_in?

   def current_user
     #if session variable is set, it finds student based on student id in the session. The ||= means its on;ly executes database query if current user doesn't exist.
     #if current user does exist, it just gets the @current_user already assigned and uses it in the logged_in def
     @current_user ||= Student.find(session[:student_id]) if session[:student_id]
   end

   def logged_in?
     !!current_user #returns true if current_user exists, esle returns false !! is true/false syntax in Rails.
   end

end
