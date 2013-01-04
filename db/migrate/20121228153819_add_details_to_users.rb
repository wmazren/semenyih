class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :type, :string
    add_column :users, :admin, :boolean
    add_column :users, :active, :boolean, :null => false, :default => true
    add_column :users, :organization_id, :integer
    add_index :users, :organization_id
  end
end
