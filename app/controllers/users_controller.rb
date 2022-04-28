class UsersController < ApplicationController

  def index 
      @users = User.all 
  end 

  def show 
      @sender = User.find(params[:users][:ids])
      @receiver = User.find(params[:receiver_id])
      @messages = Message.where(sender_id: @sender.id, receiver_id: @receiver.id).or(Message.where(sender_id: @receiver.id, receiver_id: @sender.id))
      @chat_id = [@sender.id, @receiver.id].sort.join("") #generates a unique identifier for a pair of user 
  end 
end