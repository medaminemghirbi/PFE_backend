class MessagesController < ApplicationController
  def create 
    message = Message.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id], text: params[:message])
   # redirect_back(fallback_location: "/users")
end 
end
