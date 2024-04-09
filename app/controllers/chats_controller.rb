# app/controllers/chats_controller.rb
class ChatsController < ApplicationController
  before_action :set_chat, only: %i[show destroy]

  def index
    @chats = Chat.all
  end

  def show; end

  def create
    @chat = Chat.create(chat_params)
    redirect_to chats_path
  end

  def destroy
    @chat.destroy
    redirect_to root_path
  end

  private

  def set_chat
    @chat = Chat.includes(:messages).find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:name)
  end
end
