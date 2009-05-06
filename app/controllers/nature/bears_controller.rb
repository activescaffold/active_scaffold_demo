class Nature::BearsController < ApplicationController
  active_scaffold do |c|
    c.columns[:ticks].calculate = :avg
    c.show.formats << :pdf
  end
end
