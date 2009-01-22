# == Schema Information
# Schema version: 12
#
# Table name: lakes
#
#  id           :integer         not null, primary key
#  title        :string(255)     default(""), not null
#  meta_title   :string(255)
#  meta_keyword :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  lock_version :integer         default(0), not null
#

class Lake < ActiveRecord::Base

  has_and_belongs_to_many :bears

end
