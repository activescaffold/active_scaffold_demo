class CreateSecurityScenario < ActiveRecord::Migration
  def self.up
    create_table "logins", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
    end

    Login.new(
      :login => 'demo_user',
      :password => 'letmein',
      :password_confirmation => 'letmein',
      :email => 'hello@hello.com'
    ).save!

    Login.new(
      :login => 'other_user',
      :password => 'letmein',
      :password_confirmation => 'letmein',
      :email => 'hello@hello.com'
    ).save!

    create_table :secured_records do |t|
      t.column :name, :string
      t.column :message, :text
      t.column :login_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table "logins"
    drop_table :secured_records
  end
end
