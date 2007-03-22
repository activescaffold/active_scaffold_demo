class Root < ActiveRecord::Base
  belongs_to :wood, :class_name => "Tree", :foreign_key => :tree_id
end
