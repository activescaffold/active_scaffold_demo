# == Schema Information
# Schema version: 12
#
# Table name: users
#
#  id            :integer         not null, primary key
#  first_name    :string(255)
#  middle_name   :string(255)
#  last_name     :string(255)
#  phone_number  :string(255)
#  email_address :string(255)
#  login         :string(255)
#  password      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  photo         :string(255)
#

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
  
  validates_filesize_of :photo, :in => 0..25.kilobytes
  
  def name
    last_name.nil? ? first_name : first_name + " " + last_name
  end

end
