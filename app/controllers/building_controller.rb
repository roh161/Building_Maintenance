# frozen_string_literal: true

class BuildingController < ApplicationController
  load_and_authorize_resource

  def index
    @building = Building.accessible_by(current_ability).all
  end

  def create
    @building = current_user.buildings.build(building_params)
    if @building.save
      flash[:notice] = 'Successfully Added building.'
      redirect_to building_index_path
    else
      flash[:error] = 'An error has occurred while creating the building.'
      render 'new'
    end
  end

  def new
    @building = current_user.buildings.new
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    flash[:notice] = 'Building was successfully removed.'
    redirect_to building_index_path
  end

  private

  def building_params
    params.permit(:name, :apartment, :lift, :floor, :parking_floor, :equipment, :latefee, :maintenance_cost)
  end
end
