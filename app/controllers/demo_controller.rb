class DemoController < ApplicationController
  def index
    redirect_to :controller => 'users'
  end
end
