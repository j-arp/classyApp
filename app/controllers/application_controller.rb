class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'nd'

  before_filter :require_login, :except => [:authenticate, :prompt]

 def require_login
    unless session.has_key? :user

      flash[:error] = "Login is required"

      redirect_to "/login"
    end
  end

end
