class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    authorize @comment
    @comment.save
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
