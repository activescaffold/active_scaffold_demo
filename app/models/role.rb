class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions

  def num_users
    self.users.size
  end

end
