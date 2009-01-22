# == Schema Information
# Schema version: 12
#
# Table name: secured_records
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  message    :text
#  login_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class SecuredRecord < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Login', :foreign_key => 'login_id'
  validates_presence_of :name, :message

  def authorized_for_destroy?
    # you can only destroy your own records
    return true unless existing_record_check?
    return (current_user and current_user == self.owner)
  end

  def message_authorized_for_update?
    # you can only update your own messages
    return true unless existing_record_check?
    return (current_user and current_user == self.owner)
  end

  def owner_authorized_for_update?
    # can never change the owner
    false
  end
end
