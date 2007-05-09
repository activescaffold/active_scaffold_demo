class Bear < ActiveRecord::Base
  has_and_belongs_to_many :lakes
  has_one :den
  has_one :tracking_device, :as => :taggable
end
