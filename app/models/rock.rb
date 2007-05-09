class Rock < ActiveRecord::Base

  belongs_to :forest
  validates_presence_of :forest

end
