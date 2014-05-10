class UsersController < ApplicationController
   
   def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
  	if @user.save
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

  def show
    if user_signed_in?
      @user = current_user
      @notes = Note.where({user_id: @user.id}).order(created_at: :asc).limit(3)
    else  
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end

end
