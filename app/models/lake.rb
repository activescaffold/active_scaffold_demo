class Lake < ActiveRecord::Base

  has_many :shores # a join model
  has_many :forests, :through => :shores

end
