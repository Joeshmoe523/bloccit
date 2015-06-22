class SummariesController < ApplicationController
  def new
    @summary = Summary.new
    @post = Post.find(params[:post_id])
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary 
  end

  def create
    # render "create.html.erb"
    @summary = Summary.new(summary_params)
    @post = Post.find(params[:post_id])
    @summary.post_id = @post.id
    @summary.save
    if @summary.save
      flash[:notice] = "Summary was saved."
      render :show
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new 
    end
  end


  private

  def summary_params
    params.require(:summary).permit(:body)
  end
end
