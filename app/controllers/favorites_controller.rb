class FavoritesController < ApplicationController
  before_action :require_logged_in
  
  def create
    set_favorite
    current_user.add_favorite(@post)
    render :favorites
  end

  def destroy
    set_favorite
    current_user.unfavorite(@post)
    render :favorites
  end
  
  private
  
  def set_favorite
    @post = Post.find(params[:post_id])
  end
  
end
