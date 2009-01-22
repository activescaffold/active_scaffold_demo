# == Schema Information
# Schema version: 12
#
# Table name: permissions
#
#  id          :integer         not null, primary key
#  controller  :string(255)     default(""), not null
#  action      :string(255)     default(""), not null
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Permission < ActiveRecord::Base
  has_and_belongs_to_many :roles
  
  def to_label
    controller
  end
end
