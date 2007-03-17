class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.column :name, :string
      t.column :web_site, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    create_table :company_branches do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :city, :string
      t.column :state, :string
      t.column :postal_code, :string
      t.column :company_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    create_table :company_addresses do |t|
      t.column :address, :string
      t.column :city, :string
      t.column :state, :string
      t.column :postal_code, :string
      t.column :company_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :company_branches
    drop_table :company_addresses
    drop_table :companies
  end
end
