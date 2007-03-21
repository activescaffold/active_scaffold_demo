class Forest < ActiveRecord::Base

  has_one :rock, :dependent => :destroy
  has_many :trees, :dependent => :destroy
  has_many :shores # a join model
  has_many :lakes, :through => :shores
  has_many :branches, :through => :trees

  validates_presence_of :name

end
