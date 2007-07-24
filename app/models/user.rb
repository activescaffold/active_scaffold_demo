class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :aliases, :dependent => :destroy
  has_many :addresses, :as => :addressable

  validates_presence_of :first_name, :last_name
  file_column :photo#, :magick => { 
  #   :versions => {
  #     :thumb => {:size => "40x40"} 
  #   } 
  # }
  
  def name
    last_name.nil? ? first_name : first_name + " " + last_name
  end

end
