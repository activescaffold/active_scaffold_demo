module AuthenticatedSystem
  protected
    # Returns true or false if the user is logged in.
    # Preloads @current_login with the user model if they're logged in.
    def logged_in?
      current_login != :false
    end
    
    # Accesses the current login from the session.
    def current_login
      @current_login ||= (session[:login] && Login.find_by_id(session[:login])) || :false
    end
    
    # Store the given login in the session.
    def current_login=(new_login)
      session[:login] = (new_login.nil? || new_login.is_a?(Symbol)) ? nil : new_login.id
      @current_login = new_login
    end
    
    # Check if the login is authorized.
    #
    # Override this method in your controllers if you want to restrict access
    # to only a few actions or if you want to check if the login
    # has the correct rights.
    #
    # Example:
    #
    #  # only allow nonbobs
    #  def authorize?
    #    current_login.login != "bob"
    #  end
    def authorized?
      true
    end

    # Filter method to enforce a login requirement.
    #
    # To require logins for all actions, use this in your controllers:
    #
    #   before_filter :login_required
    #
    # To require logins for specific actions, use this in your controllers:
    #
    #   before_filter :login_required, :only => [ :edit, :update ]
    #
    # To skip this in a subclassed controller:
    #
    #   skip_before_filter :login_required
    #
    def login_required
      username, passwd = get_auth_data
      self.current_login ||= Login.authenticate(username, passwd) || :false if username && passwd
      logged_in? && authorized? ? true : access_denied
    end
    
    # Redirect as appropriate when an access request fails.
    #
    # The default action is to redirect to the login screen.
    #
    # Override this method in your controllers if you want to have special
    # behavior in case the login is not authorized
    # to access the requested action.  For example, a popup window might
    # simply close itself.
    def access_denied
      respond_to do |accepts|
        accepts.html do
          store_location
          redirect_to :controller => '/account', :action => 'login'
        end
        accepts.xml do
          headers["Status"]           = "Unauthorized"
          headers["WWW-Authenticate"] = %(Basic realm="Web Password")
          render :text => "Could't authenticate you", :status => '401 Unauthorized'
        end
      end
      false
    end  
    
    # Store the URI of the current request in the session.
    #
    # We can return to this location by calling #redirect_back_or_default.
    def store_location
      session[:return_to] = request.request_uri
    end
    
    # Redirect to the URI stored by the most recent store_location call or
    # to the passed default.
    def redirect_back_or_default(default)
      session[:return_to] ? redirect_to_url(session[:return_to]) : redirect_to(default)
      session[:return_to] = nil
    end
    
    # Inclusion hook to make #current_login and #logged_in?
    # available as ActionView helper methods.
    def self.included(base)
      base.send :helper_method, :current_login, :logged_in?
    end

    # When called with before_filter :login_from_cookie will check for an :auth_token
    # cookie and log the user back in if apropriate
    def login_from_cookie
      return unless cookies[:auth_token] && !logged_in?
      user = Login.find_by_remember_token(cookies[:auth_token])
      if user && user.remember_token?
        user.remember_me
        self.current_login = user
        cookies[:auth_token] = { :value => self.current_login.remember_token , :expires => self.current_login.remember_token_expires_at }
        flash[:notice] = "Logged in successfully"
      end
    end

  private
    @@http_auth_headers = %w(X-HTTP_AUTHORIZATION HTTP_AUTHORIZATION Authorization)
    # gets BASIC auth info
    def get_auth_data
      auth_key  = @@http_auth_headers.detect { |h| request.env.has_key?(h) }
      auth_data = request.env[auth_key].to_s.split unless auth_key.blank?
      return auth_data && auth_data[0] == 'Basic' ? Base64.decode64(auth_data[1]).split(':')[0..1] : [nil, nil] 
    end
end
