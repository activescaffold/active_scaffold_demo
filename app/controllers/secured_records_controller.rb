class SecuredRecordsController < DemoController
  active_scaffold do |config|
    config.columns = [:name, :message, :owner]
    columns[:owner].ui_type = :select
  end
end
