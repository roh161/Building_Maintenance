# frozen_string_literal: true

class MaintenancesController < ApplicationController
  def index
    case current_user.role.downcase
    when 'admin'
      @maintenance = Maintenance.all
    when 'building owner'
      @maintenance = Maintenance.all
    when 'client'
      @maintenance = current_user.maintenances.all
    end
  end

  def new
    @maintenance = Maintenance.new
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)
    @maintenance.user = current_user
    if @maintenance.save
      flash[:notice] = 'Maintenance successfully created.'
      redirect_to maintenances_path
    else
      flash[:error] = 'An error has occurred while creating the maintenance.'
      render 'new'
    end
  end

  def show
    @maintenance = Maintenance.find(params[:id])
  end

  def edit
    @maintenance = Maintenance.find(params[:id])
  end

  def update
    @maintenance = Maintenance.find(params[:id])
    if @maintenance.update(params.permit(:owner_comment))
      flash[:notice] = 'Maintenance successfully updated.'
      redirect_to maintenances_path
    else
      flash[:error] = 'An error has occurred while updating the maintenance.'
      redirect_to maintenances_path
    end
  end

  private

  def maintenance_params
    params.permit(:issue_type, :description, :owner_comment)
  end
end
