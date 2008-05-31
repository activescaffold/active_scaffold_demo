# == Schema Information
# Schema version: 12
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  name        :string(255)     default(""), not null
#  description :string(255)
#  omnipotent  :boolean         not null
#  system_role :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions

  validates_presence_of :name
end
