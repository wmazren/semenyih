class PhysiciansController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(params[:physician])
    if @physician.save
      flash[:notice] = "New Account for Physician created"
      redirect_to dashboards_path
    else
      render 'new'
    end
  end

  def edit
    @physician = Physician.find(params[:id])
  end

  def update
    @physician = Physician.find(params[:id])

    if params[:physician][:password].blank?
      params[:physician].delete(:password)
      params[:physician].delete(:password_confirmation)
    end

    if @physician.update_with_password(params[:physician])
      # sign_in @physician, :bypass => true
      flash[:notice] = "Successfully updated physician."
      redirect_to physicians_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @physician = Physician.find(params[:id])
    @physician.destroy
    flash[:notice] = "Successfully destroyed physician."
    redirect_to physicians_url
  end
end
