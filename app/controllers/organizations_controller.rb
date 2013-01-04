class OrganizationsController < ApplicationController
  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      flash[:notice] = "Successfully updated account."
      redirect_to dashboards_path
    else
      render :action => 'edit'
    end
  end
end
