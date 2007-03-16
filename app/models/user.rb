class User < ActiveRecord::Base
  belongs_to :company_branch# this isn't working, :class => "CompanyBranch"
  has_and_belongs_to_many :roles
  has_many :aliases, :dependent => :destroy
  
  def name
    first_name + " " + last_name
  end
  
end
