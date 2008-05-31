# == Schema Information
# Schema version: 12
#
# Table name: dens
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  bear_id      :integer
#  park_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  lock_version :integer         default(0), not null
#

class Den < ActiveRecord::Base

  belongs_to :park
  belongs_to :bear

end
