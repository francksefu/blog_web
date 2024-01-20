class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @posts = Post.all
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @comment = current_user.comments.new(params.require(:comment).permit(:post_id, :text))
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment saved successfully'
          redirect_to(current_user)
        else
          flash[:error] = "Error : Comment didn't save"
          render :new, locals: { comment: @comment }
        end
      end
    end
  end
end
