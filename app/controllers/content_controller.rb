class ContentController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @contents = Content.all.order(id: "DESC")
  end
  def new
    @content = Content.new
  end
  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to :root
    else
      render :new
    end
  end
  def show
    @content = Content.find(params[:id]) 
    @user = User.find(@content.user_id)
    @users = User.all
    @comment = Comment.new
    @comments = Comment.all.order(id: "DESC")
  end
  def destroy
    @content = Content.find(params[:id]) 
    if @content.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def content_params
    params.require(:content).permit(:text, :image)
    .merge(user_id:current_user.id)
  end
end
