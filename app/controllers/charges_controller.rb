class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_mission
  
  def create
    stripe_card_id =
      if params[:credit_card].present?
        CreditCardService.new(current_user.id, card_params).create_credit_card
      else
        charge_params[:card_id]
      end
  
    Stripe::Charge.create(
      customer: current_user.customer_id,
      source:   stripe_card_id,
      amount:   @mission.price_in_cents,
      currency: 'usd'
    )
  
    if params[:credit_card].present? && stripe_card_id
      current_user.credit_cards.create_with(card_params).find_or_create_by(stripe_id: stripe_card_id)
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @mission
  end
  
  private
  
  def card_params
    params.require(:credit_card).permit(:number, :month, :year, :cvc)
  end
  
  def charge_params
    params.require(:charge).permit(:card_id)
  end
  
  def find_mission
    @mission = Mission.find(params[:mission_id])
  rescue ActiveRecord::RecordNotFound => e
    flash[:error] = 'Mission not found!'
    redirect_to root_path
  end
end