class UsersController < ApplicationController

  active_scaffold

  def delete_all
    Company.destroy_all
    index
  end
end
