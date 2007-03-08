class AlphasController < ApplicationController

  active_scaffold :alpha do |config|
    config.create.columns.exclude(:meta_title, :meta_keyword)
    config.create.columns.add_subgroup "Subgroup" do |group|
      group.add(:meta_title, :meta_keyword)
    end

    config.update.columns.exclude(:meta_title, :meta_keyword)
    config.update.columns.add_subgroup "Subgroup" do |group|
      group.add(:meta_title, :meta_keyword)
    end
  end

end
