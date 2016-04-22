class UsersController < ApplicationController
  def index
  end

  def new
    @users = User.all
  end

  def create
  	user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/users/new"
    else 
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private 
  	def user_params
  		params.require(:user).permit(:name, :alias,:dob, :email, :password, :password_confirmation )
  	end
end
