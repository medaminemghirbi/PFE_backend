class MessagesController < ApplicationController

    def index      
        render json:  Message.all ,include: [  :sender , :receiver ]  
    end 

    def create 
        message = Message.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id], text: params[:message])
        ActionCable.server.broadcast("hypothetical_channel", message: message)

        SendMessageJob.perform_later(message)
        render json: message ,include: [  :sender , :receiver ]  
        
    end 

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        ActionCable.server.broadcast 'remove_channel', content: @message 
    end

end
