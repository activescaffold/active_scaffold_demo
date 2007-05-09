class Park < ActiveRecord::Base
  has_many :dens
  has_many :bears, :through => :dens
end
