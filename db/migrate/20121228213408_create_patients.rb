
class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :sex
      t.string :marital_status
      t.string :identification_number
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode
      t.string :state
      t.string :country
      t.string :phone_home
      t.string :phone_mobile
      t.string :phone_office
      t.string :email
      t.string :company
      t.string :occupation
      t.string :blood_type
      t.text :notes
      t.integer :organization_id
      t.integer :parent_id

      t.timestamps
    end
    add_index :patients, :organization_id
  end
end
