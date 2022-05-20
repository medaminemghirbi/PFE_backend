class MessageController < ApplicationController
  def sendmessage 
    @message = Message.new(post_params)
    if @message.save 
        render json: @message ,statut: :created, location: @message 
   
    else
        render json: @message.errors, statut: :unprocessable_entity
    end    
  end   
  def getmessagebysender
    @message = Message.where(sender_id:  params[:sender_id] )
    render json: @message  
  end
  def getmessagebyreceiver
    
    @message = Message.where(receiver_id:  params[:receiver_id] )
    render json: @message  
  end
    def post_params
    params.permit(:sender_id , :receiver_id, :text)
end
end