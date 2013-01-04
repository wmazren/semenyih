class User < ActiveRecord::Base
  has_many :appointments
  has_many :patients, :through => :appointments
  belongs_to :organization

  validates :username, :presence => true

  accepts_nested_attributes_for :organization

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :first_name, :last_name, :middle_name,
                  :organization_id, :admin, :type, :organization_attributes, :active

  def active_for_authentication?
    super && self.organization.active
  end

  private
end
