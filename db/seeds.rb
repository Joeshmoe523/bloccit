require 'faker'

#Create Posts
50.times do 
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
posts = Post.all

#Create unique Post
unique_title = 'Unique post 1'
unique_post = Post.find_by(title: unique_title)

if unique_post == nil
  Post.create!(
    title: 'Unique post 1',
    body: 'Text for Unique post 1'
  )
else 
  puts "A post with this title already exists"
end

#Create Comments
100.times do 
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

#Create unique Comment
unique_comment_body = 'I am an unique comment!'
unique_comment = Comment.find_by(body: unique_comment_body)

if unique_comment == nil
  Comment.create!(
    post: posts.sample,
    body: 'I am an unique comment!'
  )
else 
  puts "A comment with this title already exists"
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"