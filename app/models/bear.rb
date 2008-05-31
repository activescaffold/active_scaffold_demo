# == Schema Information
# Schema version: 12
#
# Table name: bears
#
#  id           :integer         not null, primary key
#  name         :string(255)     not null
#  created_at   :datetime
#  updated_at   :datetime
#  lock_version :integer         default(0), not null
#  ticks        :integer
#

class Bear < ActiveRecord::Base
  has_and_belongs_to_many :lakes
  has_one :den
  has_one :tracking_device, :as => :taggable
end
