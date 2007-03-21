class Permission < ActiveRecord::Base
  has_and_belongs_to_many :roles
  
  def to_label
    controller
  end
end
