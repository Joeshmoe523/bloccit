require 'rails_helper'

describe User do 

  include TestFactories

  before do
    @post_notfav = associated_post
    @post_fav = associated_post
    @user = authenticated_user

    @post_fav.favorites.create(user: @user)

    @post_alsonotfav = associated_post

  end

  describe "#favorited(post)" do 
    it "returns 'nil' if the user has not favorited the post" do
      expect( @user.favorited(@post_notfav) ).to eq( nil )
    end

    it "returns the appropriate favorite if it exists" do 
      expect( @user.favorited(@post_fav).post_id ).to eq( @post_fav.id )
    end

    it "returns 'nil' if the user has favorited another post" do 
      expect( @user.favorited(@post_alsonotfav) ).to eq( nil )
    end
  end

  describe ".top_rated" do 

    include 

    before do 
      @user1 = create(:user_with_post_and_comment)

      @user2 = create(:user_with_post_and_comment, comments_count: 5)

    end

    it "returns users ordered by comments + posts" do 
      expect( User.top_rated ).to eq([@user2, @user1])
    end

    it "stores a 'posts_count' on user" do 
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end

    it "stores a 'comments_count' on user" do 
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end
  end
end