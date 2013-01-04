class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @appointment.patient_id = params[:patient_id]
  end

  def create
    @appointment = Appointment.new(params[:appointment])

    if @appointment.save
      flash[:notice] = "New appointment record created"
      redirect_to dashboards_path
    else
      render 'new'
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(params[:appointment])
      flash[:notice] = "Successfully updated appointment notes."
      redirect_to dashboards_path
    else
      render :action => 'edit'
    end
  end
end
