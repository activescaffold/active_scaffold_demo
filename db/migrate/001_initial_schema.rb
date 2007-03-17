class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :alphas, :force => true do |t|
      t.column :name, :string
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :betas, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :alpha_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end

    create_table :gammas, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :alpha_id, :integer
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :deltas, :force => true do |t|
      t.column :title, :string, :null => false
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :alphas_deltas, :id => false, :force => true do |t|
      t.column :alpha_id, :integer
      t.column :delta_id, :integer
    end

    create_table :epsilons, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :gamma_id, :integer
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :zetas, :force => true do |t|
      t.column :name, :string, :null => false
      t.column :gamma_id, :integer
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end
  end

  def self.down
    %w(alphas betas gammas deltas alphas_deltas epsilons zetas).each { |table| drop_table(table) }
  end
end
