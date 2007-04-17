class RolesController < DemoController

  active_scaffold :roles do |config|
    config.theme = :blue
    config.actions.exclude :search
    config.actions << :field_search
  end

end
