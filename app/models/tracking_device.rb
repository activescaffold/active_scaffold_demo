# == Schema Information
# Schema version: 12
#
# Table name: tracking_devices
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  taggable_id   :integer
#  taggable_type :string(255)
#

class TrackingDevice < ActiveRecord::Base
  belongs_to :taggable, :polymorphic => true
end
