class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if current_user != User.find(params[:id])
      redirect_to @user
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = "Update Success!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :region, :profile)
  end
 
end
