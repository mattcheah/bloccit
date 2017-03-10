require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:spost) {topic.sponsoredPosts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1..100)) }
   
   it{is_expected.to belong_to(:topic) }
   
   describe "attributes" do
      it "has title, body, and price attributes" do
         expect(spost.title).not_to be_nil
         expect(spost.body).not_to be_nil
         expect(spost.price).not_to be_nil
      end
      
      it "has a price greater than 0" do
         expect(spost.price).to be_greather_than 0
      end
   end
end
