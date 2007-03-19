class Root < ActiveRecord::Base
  
  belongs_to :wood, :class_name => "Tree"
  
end
