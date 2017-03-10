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
5.times do
   Topic.create!(
      name: RandomData.random_sentence,
      description: RandomData.random_paragraph
   )
end
topics=Topic.all

50.times do
   SponsoredPost.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: rand(1..100),
      topic: topics.sample
   )
end

#create posts

50.times do 
   Post.create!(
         title: RandomData.random_sentence,
         body: RandomData.random_paragraph,
         topic: topics.sample
   )
end
posts = Post.all

#Create Comments
100.times do
   Comment.create!(
      post:posts.sample,
      body: RandomData.random_paragraph
   )
end

puts "Seed Finished"
puts "#{Topic.count} topics created"
puts "#{SponsoredPost.count} sponsored Posts created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"



