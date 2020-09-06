class UserController < ApplicationController
  def index
  end
  def show
    @user = User.find(params[:id])
    @contents = Content.where(user_id: @user.id)
    @chat = Chat.new
    @chats = Chat.all.order(id: "DESC")
    @users = User.all
  end
end
