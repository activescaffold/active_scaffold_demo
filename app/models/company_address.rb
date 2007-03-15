class CompanyAddress < ActiveRecord::Base
  belongs_to :company
  
  def to_label
    city
  end
end
