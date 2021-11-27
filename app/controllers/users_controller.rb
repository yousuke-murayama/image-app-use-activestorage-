class UsersController < ApplicationController
  
  before_action :require_logged_in, only: [:show, :edit, :update, :likes]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録が完了しました"
      redirect_to @user
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_url
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "正常に変更されました"
      redirect_to @user
    else
      flash[:danger] = "変更されませんでした"
      render :edit
    end
  end
  
  def likes
    @like_posts = current_user.like_posts
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :icon, :password, :password_confirmation)
  end
end
