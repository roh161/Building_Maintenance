# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from Stripe::InvalidRequestError do
    flash[:error] = 'Could not find payment information'
    redirect_to payment_path(:building_id, :maintenance_cost)
  end
end
