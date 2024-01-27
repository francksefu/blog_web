class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end
end
