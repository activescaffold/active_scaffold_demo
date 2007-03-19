class Forest < ActiveRecord::Base

  has_one :rock, :dependent => :destroy
  has_many :trees, :dependent => :destroy
#  has_many :branches, :through => :trees :source => :employees#, :select => "distinct users." #:unique => true
  has_and_belongs_to_many :lakes

  validates_presence_of :name

end
