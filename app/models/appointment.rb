class Appointment < ActiveRecord::Base
  belongs_to :physician
  belongs_to :patient
  belongs_to :organization

  before_create :check_open
  before_create :check_pending_medication

  validates :appointment_date,
            :physician_id,
            :patient_id,
            :organization_id,
            :state,
            :presence => true

  attr_accessible :appointment_date, :physician_id, :patient_id, :organization_id, :notes, :state

  private

  def check_open
    patient.appointments.find_by_state("open").nil? ? true : false
  end

  def check_pending_medication
    patient.appointments.find_by_state("pending medication").nil? ? true : false
  end
end
