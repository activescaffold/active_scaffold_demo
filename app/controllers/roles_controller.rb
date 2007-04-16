class RolesController < DemoController

  active_scaffold :roles do |config|
    config.theme = :blue
  end

end
