class SessionsController < ApplicationController
  
  def new
    
  end

  def dashboard
    @user = User.find(session[:user_id])
     @projects = Project.where(["user_id = ?",  @user[:id]])
    
  end


  def login
    @user = User.find_by(email: permit[:email])   
    if @user && @user.authenticate(permit[:password])     
      session[:user_id] = @user.id
      redirect_to '/'
    else      
       flash.now[:errors] = 'Invalid Email or password'
       render 'new'     

    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/login'
  end

  def permit
    params.require(:user).permit(:email, :password)
  end
end
