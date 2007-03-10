class UsersController < DemoController

  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
  end

  active_scaffold :user do |config|
    config.actions << :field_search
    field_search.link.label = "Search By Field"

    config.columns = [:id, :name, :first_name, :middle_name, :last_name, :phone_number, :email_address, :login, :password, :location, :groups, :roles]
    columns[:location].ui_type = :select
    columns[:phone_number].description = "(Format: ###-###-####)"
    columns[:phone_number].label = "Phone"
    
    create.columns.exclude :id, :name, :groups, :roles, :location
    list.columns.exclude :first_name, :middle_name, :last_name, :roles
    list.sorting = {:login => 'ASC'}
    update.columns.exclude :id, :name
    
  end

end
