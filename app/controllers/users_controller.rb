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

   def edit
    @user = User.find(params[:format])
  end

   def update
    @user = User.find(params[:format])    
    @user.update(params.require(:user).permit(:name, :email, :password))
    redirect_to '/dashboard'
  end

  def destroy   
    @user = User.find(params[:format])
    if current_user.admin
      @user.destroy
      redirect_to '/dashboard'
    elsif current_user.email == @user[:email]     
      @user.destroy
      session[:user_id] = nil   
      redirect_to '/login'   
    else
      flash.now[:errors] = 'You dont have admin priviledges'
      redirect_to '/dashboard'
    end   
        
  end

  def admin
    @user = User.find(params[:format])
    if @user.admin == false || @user.admin == nil
      @user.update_attribute(:admin, true)
      redirect_to '/dashboard'
    else
      @user.update_attribute(:admin, false)
      redirect_to '/dashboard'
    end
    
    
  end
end
