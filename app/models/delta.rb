class Delta < ActiveRecord::Base

  has_and_belongs_to_many :alphas, :foreign_key => :delta_id

end
