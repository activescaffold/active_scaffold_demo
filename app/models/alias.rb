# == Schema Information
# Schema version: 12
#
# Table name: aliases
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Alias < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :user
end
