class UsersController < ApplicationController
  
  before_action :require_logged_in, only: [:show]

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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :password, :password_confirmation)
  end
end