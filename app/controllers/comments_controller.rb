class CommentsController < ApplicationController
  before_action :require_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id
    
    @comments = @post.comments
    
    if @comment.save
      render :create
    else
      render :error
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
