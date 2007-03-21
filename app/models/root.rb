class Root < ActiveRecord::Base
  
  #FIXME 2007-03-20 (EJM) Level=0 - This doesn't work
  #belongs_to :wood, :class_name => "Tree", :foreign_key => :tree_id
  belongs_to :tree
end
