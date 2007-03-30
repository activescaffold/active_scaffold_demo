class Nature::TreesController < ApplicationController

  active_scaffold :trees do |config|
    config.columns[:num_leaves].calculate = :sum
  end

end

