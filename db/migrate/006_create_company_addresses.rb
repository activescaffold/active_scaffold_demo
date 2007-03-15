class CreateCompanyAddresses < ActiveRecord::Migration
  def self.up
    create_table :company_addresses do |t|
      t.column :address, :string
      t.column :city, :string
      t.column :state, :string
      t.column :postal_code, :string
      t.column :company_id, :integer
    end
  end

  def self.down
    drop_table :company_addresses
  end
end
