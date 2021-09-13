class MessagesController < ApplicationController
  def index
    @message = Message.new
    @map = Map.find(params[:map_id])
  end

  def create
    @map = Map.find(params[:map_id])
    @message = @map.messages.new(message_params)
    if @message.save
      redirect_to map_messages_path(@map)
    else
      @messages = @map.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:comment,:image).merge(user_id: current_user.id)
  end
end
