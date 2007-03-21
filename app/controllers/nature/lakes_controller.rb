class Nature::LakesController < ApplicationController

  active_scaffold do |config|
    [:list, :create, :update, :search].each {|action| send(action).columns.exclude :forests}
  end

end
