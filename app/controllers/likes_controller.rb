class LikesController < ApplicationController
  def new; end

  def create
    @post = Post.find(params[:post][:id])
    @like = Like.new(post: @post, user_id: current_user.id)
    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Like saved successfully'
        else
          flash[:error] = "Error : Like didn't save"
        end
        redirect_to(current_user)
      end
    end
  end
end
