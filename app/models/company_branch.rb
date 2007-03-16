class CompanyBranch < ActiveRecord::Base
  belongs_to :company
  has_many :employees, :class_name => "User"
end
