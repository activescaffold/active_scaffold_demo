class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :aliases, :dependent => :destroy
  has_many :addresses, :as => :addressable

  validates_presence_of :first_name

  def name
    first_name.to_s + " " + last_name.to_s
  end
end
