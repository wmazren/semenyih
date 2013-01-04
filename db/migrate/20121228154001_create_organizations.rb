class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, :null => false, :default => ""
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode
      t.string :state
      t.string :country
      t.string :phone
      t.string :fax
      t.boolean :active, :null => false, :default => true
      t.date :register_date
      t.date :expiry_date

      t.timestamps
    end

    add_index :organizations, :name,      :unique => true
  end
end
