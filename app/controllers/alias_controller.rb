class AliasController < ApplicationController
  active_scaffold :alias do |config|
    config.columns[:name].set_link 'edit', :position => :replace
  end
end
