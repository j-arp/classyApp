class SessionController < ApplicationController
  # GET /users
  # GET /users.json
  
  #before_filter :require_login, :except=>[:login_user,:prompt,:logout_user]
  



def authenticate
    
    @user = User.find_by_username_and_password(params[:user][:username], params[:user][:password])
    puts @user

    if !@user.nil?
      flash[:message] = "You have been logged in!"
      session[:user] = {id: @user.id}
      
      redirect_to students_path

    else
      flash[:error] = "Login Failed. Please try again..."
      redirect_to "/login"
    end

  end



  def logout
    session[:user] = nil
    flash[:message] = "Goodbye. You have been logged out."
    redirect_to "/login"
  end

  def prompt
    @user = User.new
  end


  def get_user
    if session.has_key? :user
        @user = user.find(session[:user][:id])      
    end

  end

end
