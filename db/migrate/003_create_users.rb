class CreateUsers < ActiveRecord::Migration
  def self.up

    create_table :users do |t|
      t.column :first_name, :string
      t.column :middle_name, :string
      t.column :last_name, :string
      t.column :phone_number, :string
      t.column :email_address, :string
      t.column :login, :string
      t.column :password, :string
      t.column :company_branch_id, :integer
    end

    create_table :permissions do |t|
      t.column "controller", :string, :default => "", :null => false
      t.column "action", :string, :default => "", :null => false
      t.column "description", :string
    end

    create_table :roles do |t|
      t.column "name", :string, :default => "", :null => false
      t.column "description", :string
      t.column "omnipotent", :boolean, :default => false, :null => false
      t.column "system_role", :boolean, :detault => false
    end

    create_table :permissions_roles, :id => false do |t|
      t.column "permission_id", :integer, :default => 0, :null => false
      t.column "role_id", :integer, :default => 0, :null => false
    end

    create_table :roles_users, :id => false do |t|
      t.column "user_id", :integer, :default => 0, :null => false
      t.column "role_id", :integer, :default => 0, :null => false
    end
  end

  def self.down
    drop_table :permissions_roles
    drop_table :roles_users
    drop_table :permissions
    drop_table :roles
    drop_table :users
    drop_table :locations
  end
end
