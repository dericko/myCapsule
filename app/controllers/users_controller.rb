class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user.User.new(user_params)
  	if @user.save
  		redirect_to_users_path
  	else
  		render 'new'
  	end
  end

  private

  def user_params
  	param.require(:user).permit(:name, :email, :password)
  end


  def index
  	@users = User.all
  end

  def edit
  end

  def delete
  end
end
