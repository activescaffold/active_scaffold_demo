class Nature::TreesController < ApplicationController

  active_scaffold :trees do |config|
    config.columns[:num_branches].calculate = :sum
  end

end

