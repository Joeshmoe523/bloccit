class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = Comment.new(comment_params)

    @comment.user = current_user
    @comment.post = @post
    
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :create
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error deleting the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
