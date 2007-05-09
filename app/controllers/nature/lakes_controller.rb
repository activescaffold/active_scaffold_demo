class Nature::LakesController < ApplicationController

  active_scaffold do |config|
    [:list, :create, :update, :search].each {|action| config.send(action).columns.exclude :bears}
    config.subform.columns.exclude :meta_title, :meta_keyword

    config.columns[:meta_title].label = 'Title'
    config.columns[:meta_keyword].label = 'Keyword'

    config.create.columns.exclude(:meta_title, :meta_keyword)
    config.create.columns.add_subgroup "Meta Information" do |group|
      group.add(:meta_title, :meta_keyword)
    end

    config.update.columns.exclude(:meta_title, :meta_keyword)
    config.update.columns.add_subgroup "Meta Information" do |group|
      group.add(:meta_title, :meta_keyword)
    end
  end

end
