class Patient < ActiveRecord::Base
  has_many :appointments
  has_many :physicians, :through => :appointments
  belongs_to :organization
  has_many :childrens, :class_name => "Patient", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Patient"

  attr_accessible :first_name, :last_name, :middle_name, :identification_number, :dob,
                  :address1, :address2, :postcode, :city, :state, :blood_type,
                  :notes,
                  :organization_id, :sex, :marital_status, :parent_id, :children_ids

  private

  def children
    Patient.find(:all, :conditions => ['father_id=? or mother_id=?', id, id])
  end
end
