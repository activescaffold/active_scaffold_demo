# == Schema Information
# Schema version: 12
#
# Table name: parks
#
#  id           :integer         not null, primary key
#  name         :string(255)     default(""), not null
#  created_at   :datetime
#  updated_at   :datetime
#  lock_version :integer         default(0), not null
#

class Park < ActiveRecord::Base
  has_many :dens
  has_many :bears, :through => :dens
end
