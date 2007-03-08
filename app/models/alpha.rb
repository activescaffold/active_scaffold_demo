class Alpha < ActiveRecord::Base

  has_one :beta, :dependent => :destroy
  has_many :gammas, :dependent => :destroy
  has_and_belongs_to_many :deltas

  validates_presence_of :name

end
