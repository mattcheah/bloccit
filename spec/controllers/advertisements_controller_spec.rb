require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  
  let(:my_advertisement) {Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5) 
  }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "has a price of 5" do
      get :index
      expect(my_advertisement.price).to eq 5 
    end
    
     it "assigns [my_advertisement] to @advertisements" do
       get :index
       expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_advertisement.id }, flash: { notice: "This is a flash message" }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the show view" do
      get :show, params: { id: my_advertisement.id }, flash: { notice: "This is a flash message" }
      expect(response).to render_template :show
    end
    
    it "assigns my_advertisement to @advertisement" do
      get :show, params: { id: my_advertisement.id }, flash: { notice: "This is a flash message" }
      expect(assigns(:advertisement)).to eq(my_advertisement)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "POST #create" do

    it "increases the number of Advertisements by 1" do
      expect{Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5)}.to change(Advertisement, :count).by(1)
    end
    
    it "assigns the new post to @advertisement" do
      my_advert = Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5)
      expect(my_advert).to eq Advertisement.last
    end
    
    it "redirects to the new post" do
      post :create, advertisement:{ title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5 }
      expect(response).to redirect_to Advertisement.last
    end
  end

end
