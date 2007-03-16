class Company < ActiveRecord::Base
  has_many :branches, :class_name => "CompanyBranch" 
  has_many :users, :through => :branches, :source => :employees#, :select => "distinct users." #:unique => true
end
