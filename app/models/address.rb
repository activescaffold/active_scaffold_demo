class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true

  def to_label
    [[self.city, self.state].compact.join(' '), self.zip].compact.join(', ')
  end

end
