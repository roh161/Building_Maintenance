# frozen_string_literal: true

class StaffsController < ApplicationController
  def index
    @building = Building.find(params[:building_id])
    @staff = @building.staffs.all
  end

  def create
    @staff = Staff.new(staff_params)
    @building = Building.find_by(id: params[:id])
    @staff.building = @building
    if @staff.save
      flash[:notice] = 'Staff was successfully added.'
      redirect_to building_staff_index_path
    else
      flash[:error] = 'An error has occurred while creating the staff.'
      render 'new'
    end
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    flash[:notice] = 'Staff was successfully removed.'
    redirect_to building_staff_index_path(params[:bid])
  end

  private

  def staff_params
    params.permit(:name, :salary)
  end
end
