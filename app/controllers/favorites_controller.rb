class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    authorize favorite
    if favorite.save
      flash[:notice] = "Post has been added to your favorites."
      redirect_to [post.topic, post]
    else
      flash[:error] = "This post has not been favorited. Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = Favorite.find(params[:id])

    authorize favorite 
    if favorite.destroy
      flash[:notice] = "Post has been removed from your favorites."
      redirect_to [post.topic, post]
    else
      flash[:error] = "This post has not been unfavorited. Please try again."
      redirect_to [post.topic, post]
    end    
  end

end
