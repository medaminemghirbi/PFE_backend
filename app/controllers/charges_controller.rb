require 'stripe'
class ChargesController < ApplicationController
  # include CurrentUserConcern
  def create
    Stripe.api_key = 'sk_test_51L00opGaJ06Z6ByyZkx90mQaKVl2bHdg83poXzJreYDwrV5xXypk9xgCHFPLrsg4IcpAzHrhpM5owg2kWPsqNx4600aP17X6Aa'

    begin
      customer = Stripe::Customer.create({  

                                           card: params[:token][:id],
                                           email: params[:token][:email]
                                           #  description: 'My First Test Customer (created for API docs)'

                                         })

      charge = Stripe::Charge.create({
                                       customer: customer.id,
                                       amount: params[:amount],
                                       currency: 'eur',
                                       source: params[:token][:card][:id], # obtained with Stripe.js
                                       description: 'Freelancy mission payement'
                                     })
    end
  end
end
