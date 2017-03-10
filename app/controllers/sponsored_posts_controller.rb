class SponsoredPostsController < ApplicationController
   
   def show
      @sponsoredPost = SponsoredPost.find(params[:id])
   end
   
   def new
      @sponsoredPost = SponsoredPost.new
      @topic = Topic.find(params[:topic_id])
   end
   
   def create
      @sponsoredPost = SponsoredPost.new
      @sponsoredPost.title = params[:sponsoredPost][:title]
      @sponsoredPost.body = params[:sponsoredPost][:body]
      @sponsoredPost.price = params[:sponsoredPost][:price]
      
      @sponsoredPost.topic_id = params[:topic_id]
      
      if @sponsoredPost.save
         flash[:notice] = "Your Sponsored Post was successfully saved"
         redirect_to [@sponsoredPost.topic, @sponsoredPost]
      else
         flash.now[:alert] = "Your Sponsored Post was unable to be saved. Please Try Again"
         render :new
      end
   end
   
   def edit
      @sponsoredPost = SponsoredPost.find(params[:id])
   end
   
   def update 
      @sponsoredPost = SponsoredPost.find(params[:id])
      @sponsoredPost.title = params[:sponsored_post][:title]
      @sponsoredPost.body = params[:sponsored_post][:body]
      @sponsoredPost.price = params[:sponsored_post][:price]
      
      if @sponsoredPost.save
         flash[:notice] = "Your Sponsored Post was edited"
         redirect_to [@sponsoredPost.topic, @sponsoredPost]
      else
         flash.now[:alert] = "Your Sponsored Post was unable to be edited. Please Try Again"
         render :edit
      end
      
   end
   
   def destroy
      @sponsoredPost = SponsoredPost.find(params[:id])
      
      if @sponsoredPost.destroy
         flash[:notice] = "Your Sponsored Post was successfully deleted"
         redirect_to @sponsoredPost.topic
      else
         flash.now[:alert] = "Your Sponsored Post was unable to be deleted. Please Try Again"
         render :show
      end  
   end
      
end
