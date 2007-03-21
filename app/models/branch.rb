class Branch < ActiveRecord::Base
  belongs_to :tree
  has_many :forests, :through => :tree
end
