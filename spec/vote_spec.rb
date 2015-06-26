require 'rails-helper'

describe Vote do 
  describe "validations" do

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @post.vote.value != ( 1 || -1 )).to eq(true)
      end
    end

  end
end