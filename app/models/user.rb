class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :aliases, :dependent => :destroy
  
  validates_presence_of :first_name
  
  def name
    first_name + " " + last_name
  end
  
  def create_authorized?(user)
    true
  end
  
end
