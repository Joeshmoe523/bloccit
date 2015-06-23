class Topic < ActiveRecord::Base
  has_many :posts

  def per_page=(num)
    self.per_page = 50
  end

end
