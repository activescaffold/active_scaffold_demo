class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :forests, :force => true do |t|
      t.column :name, :string
      t.column :meta_title, :string
      t.column :meta_keyword, :string
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :rocks, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :forest_id, :integer, :null => false
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end

    create_table :trees, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :forest_id, :integer, :null => false
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :lakes, :force => true do |t|
      t.column :title, :string, :null => false
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :forests_lakes, :id => false, :force => true do |t|
      t.column :forest_id, :integer, :null => false
      t.column :lake_id, :integer, :null => false
    end

    create_table :trunks, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :tree_id, :integer, :null => false
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :roots, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :tree_id, :integer, :null => false
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end
    
    create_table :branches, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :tree_id, :integer, :null => false
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end
  end

  def self.down
    %w(forests rocks trees lakes forests_lakes trunks roots).each { |table| drop_table(table) }
  end
end
