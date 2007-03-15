class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.column :name, :string
      t.column :web_site, :string
    end
    add_column "users", "company_id", :integer
  end

  def self.down
    drop_table :companies
    remove_column "users", "company_id"
  end
end
