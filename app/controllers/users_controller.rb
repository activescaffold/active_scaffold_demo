class UsersController < DemoController

  active_scaffold :user do |config|
    config.columns = [:id, :name, :photo, :first_name, :middle_name, :last_name, :phone_number, :email_address,
                      :login, :password, :roles, :aliases, :addresses, :birth_day]

    config.columns[:phone_number].description = "(Format: ###-###-####)"
    config.columns[:phone_number].label = "Phone"

    config.create.columns.exclude :id, :name
    config.update.columns.exclude :id, :name
    config.list.columns.exclude :first_name, :middle_name, :last_name, :password, :phone_number
    config.subform.columns = [:first_name, :last_name, :login, :password]
    config.columns[:birth_day].options = {:start_year => 0.years.from_now.year, :end_year => 3.years.from_now.year}
    config.list.sorting = {:login => 'ASC'}

    config.nested.add_link "Names", [:aliases]

    config.create.columns.exclude(:first_name, :middle_name, :last_name, :phone_number)
    config.create.columns.add_subgroup "Personal Data" do |group|
      group.add(:first_name, :middle_name, :last_name, :phone_number)
    end
  end

end
