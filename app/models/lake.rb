class Lake < ActiveRecord::Base
  
  has_and_belongs_to_many :forests
  
end
