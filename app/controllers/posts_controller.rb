class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to(current_user)
        else
          flash[:error] = "Error : Post didn't save"
          render :new, locals: { post: @post }
        end
      end
    end
  end
end
