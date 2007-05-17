class AccountController < ApplicationController
  def index
    redirect_to(:action => 'login')
  end

  def login
    return unless request.post?
    self.current_login = Login.authenticate(params[:login], params[:password])
    if logged_in?
      respond_to do |wants|
        wants.html {
          redirect_back_or_default(:controller => '/account', :action => 'index')
          flash[:notice] = "Logged in successfully"
        }
        wants.js {
          render :update do |page| page << 'window.location.href = window.location.href' end
        }
      end
    end
  end

  def logout
    self.current_login.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    respond_to do |wants|
      wants.html {
        flash[:notice] = "You have been logged out."
        redirect_back_or_default(:controller => '/account', :action => 'index')
      }
      wants.js {
        render :update do |page| page << 'window.location.href = window.location.href' end
      }
    end
  end
end
