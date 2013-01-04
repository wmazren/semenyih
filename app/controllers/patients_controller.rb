class PatientsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    # @search = Patient.search(params[:q])
    # @patients = @search.result
    # @patients = Patient.where(:organization_id => current_user.organization_id).search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 15)
    @patients = Patient.where(:organization_id => current_user.organization_id)
  end

  def show
    @patient = Patient.find(params[:id])
    @appointment_history = @patient.appointments
    #@appointment_history = Appointment.where(:patient_id => @patient, :state => "closed")

    #@appointment_diagnosis_open = @patient.appointments.find_by_state("open")
    # @appointment_diagnosis_open = Appointment.where(:patient_id => @patient, :state => "open")
    #@appointment_diagnosis_pending_medication = Appointment.where(:patient_id => @patient, :state => "pending_medication")
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      flash[:notice] = "New patient record created"
      redirect_to patients_path
    else
      render 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(params[:patient])
      flash[:notice] = "Successfully updated patient."
      redirect_to patients_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    flash[:notice] = "Successfully destroyed patient."
    redirect_to patients_url
  end
end
