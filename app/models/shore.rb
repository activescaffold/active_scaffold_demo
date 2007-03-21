class Shore < ActiveRecord::Base
  belongs_to :forest
  belongs_to :lake
end
