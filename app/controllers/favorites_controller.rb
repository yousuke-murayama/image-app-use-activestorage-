class FavoritesController < ApplicationController
  before_action :require_logged_in
  
  def create
    @post = Post.find(params[:post_id])
    current_user.add_favorite(@post)
    render :favorites
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.unfavorite(@post)
    render :favorites
  end
end
