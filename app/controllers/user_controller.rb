class UserController < ApplicationController
  def index
  end
  def show
    @user = User.find(current_user.id)
    @contents = Content.where(user_id: @user.id)
  end
end
