require 'rails_helper'

describe Vote do 
  describe "validations" do

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        #Setup
        @post = Post.create(title: "A sample post", body: "Blah blah blah blah!!")
        @vote = @post.votes.create(value: 1)
        @post.votes.create(value: 0)
        #Execution
        #Validation


        expect( @post.votes.first.value ).to be_in( [1,-1] )
        expect( @post.votes.first ).to be_valid
        expect( @post.votes[1] ).to_not be_valid
      end
    end

  end
end
