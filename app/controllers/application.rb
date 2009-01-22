# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :generate_menu

  ActiveScaffold.set_defaults do |config|
    config.ignore_columns.add [:created_at, :updated_at]
    config.security.current_user_method = :current_login
  end

  def source
    render :partial => 'demo/source', :layout => 'popup'
  end

  def delete_all
    Alphas.destroy_all
    index
  end

  protected

  def generate_menu
    case params[:controller]
      when 'users', 'roles', 'permissions'
      @menu = Menu.new('User Management')
      @menu.entries << ['users', url_for(:controller => 'users')]
      @menu.entries << ['roles', url_for(:controller => 'roles')]
      @menu.entries << ['permissions', url_for(:controller => 'permissions')]

    end
  end
end