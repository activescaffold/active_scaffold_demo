class Company < ActiveRecord::Base
  has_many :company_addresses
  has_many :employees, :class_name => "User"
end
