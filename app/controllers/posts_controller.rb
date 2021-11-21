class PostsController < ApplicationController
  before_action :require_logged_in
  before_action :correct_post, only: [:destroy]
  
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

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :spot, :content)
  end
  
  def correct_post
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
