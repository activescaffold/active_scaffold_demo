class User < ActiveRecord::Base
  belongs_to :location
  belongs_to :company
  has_and_belongs_to_many :roles
  has_many :aliases, :dependent => :destroy
  
  def name
    first_name + " " + last_name
  end
  
end
