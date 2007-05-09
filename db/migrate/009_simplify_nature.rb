class SimplifyNature < ActiveRecord::Migration
  def self.up
#    %w(branches forests lakes rocks roots shores trees trunks).each { |table| drop_table(table) }

    create_table :bears, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :lock_version, :integer, :default => 0, :null => false
    end

    create_table :dens, :force => true do |t|
      t.column :name, :string
      t.column :bear_id, :integer
      t.column :park_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :lock_version, :integer, :default => 0, :null => false
    end

    create_table :lakes, :force => true do |t|
      t.column :title,      :string,   :default => "", :null => false
      t.column :meta_title, :string
      t.column :meta_keyword, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :lock_version, :integer, :default => 0, :null => false
    end

    create_table :bears_lakes, :id => false, :force => true do |t|
      t.column :bear_id, :integer, :null => false
      t.column :lake_id, :integer, :null => false
    end

    create_table :tracking_devices, :force => true do |t| 
      t.column :name, :string 
      t.column :taggable_id, :integer 
      t.column :taggable_type, :string 
    end
    
    create_table :parks, :force => true do |t|
      t.column :name,      :string,   :default => "", :null => false
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :lock_version, :integer, :default => 0, :null => false
    end

  end

  def self.down
    %w(bears_lakes bears dens lakes tracking_devices parks).each { |table| drop_table(table) }
  end
end
