module RolesHelper
  include DemoHelper

  def omnipotent_column(record)
    record.omnipotent? ? 'yes' : 'no'
  end

  def omnipotent_form_column(record, name)
    check_box :record, :omnipotent, :name => name
  end
end
