class Physician < User
  has_many :appointments
  has_many :patients, :through => :appointments
  belongs_to :organization

  validates :first_name, :presence => true
  validates :last_name, :presence => true
end
