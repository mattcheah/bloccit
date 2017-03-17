# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'

Post.find_or_create_by(title:"My Title", body: "My Body")
Comment.find_or_create_by(post_id: 51, body:"Comment Body")


#create topics
15.times do
   Topic.create!(
      name: RandomData.random_sentence,
      description: RandomData.random_paragraph
   )
end
topics=Topic.all

#create users
5.times do 
   User.create!(
      name: RandomData.random_name,
      email: RandomData.random_email,
      password: RandomData.random_sentence
   )
end
users = User.all

#create posts
50.times do 
   Post.create!(
         user: users.sample,
         title: RandomData.random_sentence,
         body: RandomData.random_paragraph,
         topic: topics.sample
   )
end
posts = Post.all

#Create Comments
100.times do
   Comment.create!(
      user: users.sample,
      post: posts.sample,
      body: RandomData.random_paragraph
   )
end

admin = User.create!(
   name: "admin User",
   email: "mattcheah@gmail.com",
   password: "helloworld",
   role: "admin"
)

member = User.create!(
   name: "Member user",
   email: "member@example.com",
   password: 'helloworld'
)

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"



