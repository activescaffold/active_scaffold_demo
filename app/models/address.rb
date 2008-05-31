# == Schema Information
# Schema version: 12
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  city             :string(255)
#  state            :string(255)
#  zip              :integer
#  addressable_id   :integer
#  addressable_type :string(255)
#

class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true

  def to_label
    [[self.city, self.state].compact.join(' '), self.zip].compact.join(', ')
  end

end
