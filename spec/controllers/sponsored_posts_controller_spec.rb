require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
   
   let(:my_topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:my_spost) {my_topic.sponsoredPosts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
   
   describe "GET show" do
      it "should return http success" do
         get :show, params: {topic_id:my_topic.id, id: my_spost.id} 
         expect(response).to have_http_status(:success)
      end
      
      it "should render the show view" do
         get :show, params: {topic_id:my_topic.id, id: my_spost.id} 
         expect(response).to render_template :show
      end
      
      it "should assign a sponsored post object to @spost" do
         get :show, params: {topic_id:my_topic.id, id: my_spost.id} 
         expect(assigns(:sponsoredPost)).to eq my_spost
      end
         
   end
   
   describe "GET new" do
      it "should return http success" do
         get :new, params: {topic_id:my_topic.id}
         expect(response).to have_http_status(:success)
      end
      
      it "should render the new view" do
         get :new,  params: {topic_id:my_topic.id}
         expect(response).to render_template :new
      end
      
      it "instantiates a new spost object" do
         get :new, params: {topic_id:my_topic.id}
         expect(assigns(:sponsoredPost)).not_to be_nil
      end
   end
   
   describe "POST create" do
      it "adds a spost to the database" do
         post :create, params: { topic_id: my_topic.id, sponsoredPost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1-100)} }
         expect(assigns(:sponsoredPost)).to eq(SponsoredPost.last)
      end
      
      it "redirects to show view" do
         post :create, params: { topic_id: my_topic.id, sponsoredPost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1-100)} }
         expect(response).to redirect_to [my_topic, SponsoredPost.last]
      end
   end
   
   describe "GET edit" do
      it "should return http success" do
         get :edit, params: {topic_id:my_topic.id, id: my_spost.id} 
         expect(response).to have_http_status(:success)
      end
      
      it "should render the edit view" do
         get :edit, params: {topic_id:my_topic.id, id: my_spost.id} 
         expect(response).to render_template :edit
      end
      
      it "assigns a sponsored post to @spost" do
         get :edit, params: {topic_id:my_topic.id, id: my_spost.id} 
         expect(assigns(:sponsoredPost)).to eq(my_spost)
      end
   end
   
   describe "PUT update" do
      it "updates the spost with new data" do
         new_title = RandomData.random_sentence
         new_body = RandomData.random_paragraph
         new_price = rand(1..100)
         
         put :update, params: {topic_id: my_topic.id, id: my_spost.id, sponsoredPost: {title:new_title, body: new_body, price: new_price} }
         expect(assigns(:sponsoredPost).title).to eq new_title
         expect(assigns(:sponsoredPost).body).to eq new_body
         expect(assigns(:sponsoredPost).price).to eq new_price
      end
      
      it "redirects to updated post" do
         new_title = RandomData.random_sentence
         new_body = RandomData.random_paragraph
         new_price = rand(1..100)
         
         put :update, params: {topic_id: my_topic.id, id: my_spost.id, sponsoredPost: {title:new_title, body: new_body, price: new_price} }
         
         expect(response).to redirect_to [my_topic, my_spost]
      end
   end
   
   describe "DELETE destroy" do
      it "deletes the spost" do
         delete :destroy, params: {topic_id: my_topic.id, id: my_spost.id}
         expect(SponsoredPost.where(id: my_spost.id).count).to eq 0
      end
      
      it "redirects to topics page" do
         delete :destroy, params: {topic_id: my_topic.id, id: my_spost.id}
         expect(response).to redirect_to [my_topic]
      end
   end


end
