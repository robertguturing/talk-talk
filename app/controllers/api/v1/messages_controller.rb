class Api::V1::MessagesController < ApplicationController
  def index
    if message_params[:recipient_id] && message_params[:sender_id]
      messages = Message.where(
        recipient_id: message_params[:recipient_id],
        sender_id: message_params[:sender_id]
      ).limit(100)
      render json: messages, status: :ok
    elsif message_params[:recipient_id]
      messages = Message.where(
        recipient_id: message_params[:recipient_id]
      ).limit(100)
      render json: messages, status: :ok
    else
      render json: "Needs a recipient id and an optional sender id", status: :bad_request
    end
  end

  def create
    message = Message.new(message_params)
    if message.save
      render json: message_params.to_json, status: :created
    else
      render json: message.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.permit(:text, :sender_id, :recipient_id)
  end
end
