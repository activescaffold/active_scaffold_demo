class Nature::BearsController < ApplicationController
  active_scaffold do |c|
    c.columns[:ticks].calculate = :avg
    c.formats = [:txt]
    c.list.columns << :txt
  end

  def show_respond_to_txt
    render :text => @record.name
  end

end
