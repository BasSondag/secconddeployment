class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/users/new"
  	else
  		flash[:message] = 'Invalid password or email' 
  		redirect_to "/users"
  	end
  end
end
