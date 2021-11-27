class FavoritesController < ApplicationController
  before_action :require_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.add_favorite(post)
    flash[:success] = "お気に入りに追加しました!"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:success] = "お気に入りを取り消しました"
    redirect_back(fallback_location: root_path)
  end
end
