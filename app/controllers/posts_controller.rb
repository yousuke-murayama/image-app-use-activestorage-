class PostsController < ApplicationController
  before_action :require_logged_in
  
  def show
    @post = Post.find(params[:id])
    @comment = current_user.comments.build(post_id: @post.id)
    @comments = @post.comments
  end
  
  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to current_user
    else
      flash[:danger] = "投稿できませんでした"
      render :new
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :spot, :content, :longitude, :latitude)
  end
  
end
