class MessagesController < ApplicationController

  def index
    @users = User.all
    @messages = current_user.messages.reverse
  end

  def create
    @message = Message.new(message_params)
    @message.recieved_at = Time.now
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:recipient_id, :message, :recieved_at, :amount)
  end
end
