class MessagesController < ApplicationController


  def create
    message = Message.new(message_params)
    message.save
    redirect_to couple_event_path(params[:message][:couple_id],params[:message][:event_id])
  end

  def destroy

  end

  private

  def message_params
    params.require(:message).permit(:couple_id, :content, :event_id, :date)
  end
end
