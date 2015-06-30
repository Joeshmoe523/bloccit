require 'rails_helper'

describe Vote do 

  include TestFactories

  describe "validations" do

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        #Setup
        @post = Post.create(title: "A sample post", body: "Blah blah blah blah!!")
        @post.save
        @vote = @post.votes.create(value: 1)
        @post.votes.create(value: 0)
        #Execution
        #Validation


        expect( @post.votes.first.value ).to be_in( [1,-1] )
        expect( @post.votes.first ).to be_valid
        expect( @post.votes[1] ).to_not be_valid
      end
    end

    describe 'after_save' do
      it "calls 'Post#update_rank' after save" do
        post = associated_post
        vote = Vote.new(value: 1, post: post)
        expect(post).to receive(:update_rank)
        vote.save
      end
    end

  end
end
