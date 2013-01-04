class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @physicians = Physician.where(:organization_id => current_user.organization_id)
    @patients = Patient.where(:organization_id => current_user.organization_id)
    @appointments = Appointment.where(:organization_id => current_user.organization_id, :appointment_date => Date.today)
  end
end
