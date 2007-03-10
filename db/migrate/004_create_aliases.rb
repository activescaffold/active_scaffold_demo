class CreateAliases < ActiveRecord::Migration
  def self.up
    create_table :aliases do |t|
      t.column :name, :string
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :aliases
  end
end
