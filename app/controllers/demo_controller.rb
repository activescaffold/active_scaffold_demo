class DemoController < ApplicationController
  def index
    redirect_to :controller => :user
  end
  
  def delete_all
    Group.destroy_all
    Location.destroy_all
    Permission.destroy_all
    Role.destroy_all
    User.destroy_all
    index
  end
end
