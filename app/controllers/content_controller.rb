class ContentController < ApplicationController
  def index
    @contents = Content.all
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

  private
  def content_params
    params.require(:content).permit(:text, :image)
    .merge(user_id:current_user.id)
  end
end
