class User < ActiveRecord::Base
  belongs_to :location
  has_and_belongs_to_many :roles
  has_many :aliases, :dependent => :destroy
  has_many :user_types

  def name
    first_name + " " + last_name
  end
  
end
