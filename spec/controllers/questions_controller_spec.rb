require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  
  let(:my_quest) {Question.create!(title: "Why", body: "Let me explain", resolved: false)}
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "returns the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
   
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: my_quest.id}
      expect(response).to have_http_status(:success)
    end
    
    it "returns the show view" do 
      get :show, params: {id: my_quest.id}
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: { question: {title: "Why2", body: "Let me explain", resolved: false} }
      expect(response).to redirect_to Question.last
    end
    
    it "increments the question count" do
      question_count = Question.count
      post :create, params: { question: {title: "Why2", body: "Let me explain", resolved: false} }
      expect(Question.count).to eq(question_count + 1)
    end
    
    it "adds the correct object to the database" do
      post :create, params: { question: {title: "Why2", body: "Let me explain", resolved: false} }
      expect(Question.last.title).to eq "Why2"
      expect(Question.last.body).to eq "Let me explain"
      expect(Question.last.resolved).to eq false
    end
  end
  
  describe "GET edit" do
    it "returns the edit view" do 
      get :show, params: {id: my_quest.id}
      expect(response).to render_template :show
    end
  end
  
  describe "PUT Update" do
    it "updates a question with the correct data" do
        new_title = "New Title2"
        new_body = "New Body2"
        new_resolved = true
        
        put :update, params: {id: my_quest.id, question: {title: new_title, body: new_body, resolved: new_resolved} }
        updated_post = assigns(:question)
        expect(updated_post.title).to eq new_title
        expect(updated_post.body).to eq new_body
        expect(updated_post.resolved).to eq new_resolved
    end
  end
  
  describe "DELETE Destroy" do
    it "removes an object from the table" do
      my_quest_id = my_quest.id
      delete :destroy, params: {id: my_quest_id}
      expect(Question.where(id: my_quest_id).count).to eq 0
    end
  end

end
