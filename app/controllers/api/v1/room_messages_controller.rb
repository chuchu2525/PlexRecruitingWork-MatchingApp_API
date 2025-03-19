class Api::V1::RoomMessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @room_messages = @room.room_messages.limit(20)

    render json: @room_messages, status: :ok
  end

  def create
    @room = Room.find(params[:room_id])
    @room_message = @room.room_messages.create!(room_message_params)

    render json: @room_message, status: :created
  end

  private

  def room_message_params
    params.require(:room_message).permit(:context, :sender_name)
  end
end
