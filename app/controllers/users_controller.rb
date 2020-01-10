class UsersController < ApplicationController
  def signup
    @user = User.new
  end
 
  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:errors] = @user.errors.full_messages      
      redirect_to '/signup'
    end
  end
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:student).permit(:username, :email, :password))
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
    
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
