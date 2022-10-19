# frozen_string_literal: true

# app/homecontroller
class HomeController < ApplicationController
  def index
    @user = User.all
    @b = Building.find_by(id: current_user&.building_id)
  end

  def showclients
    @building = Building.find(params[:building_id])
    @client = @building.clients.all
  end

  def create
    building = Building.find(params[:building_id])
    building.clients << current_user
    flash[:notice] = "Congratulations you are now a client of #{building.name}"
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'user has been destroyed successfully'
    redirect_to root_path
  end

  def transaction
    @user = User.find(params[:id])
    @b = Building.find_by(id: current_user&.building_id)
  end

  def charge
    building = Building.find_by(id: params[:building_id]).name
    check = true
    if !params[:cvc].match(/\d{3}/)
      flash[:alert] = 'invalid cvc'
      check = false
    elsif !params[:number].match(/\d{16}/)
      flash[:alert] = 'invalid card number'
      check = false
    end
    if check
      s = StripeService.new
      token = s.create_card_token(params)
      customer = s.find_or_create_customer(current_user)
      token = s.create_card_token(params)
      card = s.create_stripe_customer_card(token.id, customer)
      s.create_stripe_charge(params[:maintenance_cost], customer.id, card.id, building)
      current_user.change_user_to_paid
      s.maintenance_payment(current_user.id, params[:building_id], params[:maintenance_cost])
      flash[:notice] = 'Payment successfully completed without errors.'
      redirect_to root_path(current_user.id)
    else
      redirect_to root_path, alert: 'some error occured'
    end
  end

  def total_building_balance
    building = Building.find(params[:id])
    amount_array = building.payments.pluck(:amount)
    total = amount_array.sum
    @balance = Account.update(building_balance: total)
    @account = Account.all
  end

  def show; end

  def payment; end
  
end
