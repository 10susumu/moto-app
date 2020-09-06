class ChatController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @chat = Chat.create(chat_params)
    redirect_to "/user/#{@user.id}"
  end


  private
  def chat_params
    params.require(:chat).permit(:text, :user_id, :master_user_id)
  end
end
