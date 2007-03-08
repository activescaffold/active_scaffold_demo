class Gamma < ActiveRecord::Base

  belongs_to :alpha
  has_one :epsilon
  has_many :zetas

end