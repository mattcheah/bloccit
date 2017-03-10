class TopicsController < ApplicationController
   
   def index
      @topics = Topic.all
   end
   
   def show
      @topic = Topic.find(params[:id])
   end
   
   def new
      @topic =  Topic.new
   end
   
   def create
      @topic = Topic.new
      
      @topic.name = params[:topic][:name]
      @topic.description = params[:topic][:description]
      @topic.public = params[:topic][:public]
      
      if @topic.save
         flash[:notice] = "Your Topic was successfully created"
         redirect_to @topic
      else
         flash.now[:alert] = "Something went wrong and your topic could not be created. Please try again"
         render :new
      end
   end
   
   def edit
      @topic = Topic.find(params[:id])
   end
   
   def update
      @topic = Topic.find(params[:id])
      @topic.name = params[:topic][:name]
      @topic.description = params[:topic][:description]
      @topic.public = params[:topic][:public]
      
      if @topic.save
         flash[:notice] = "Your Topic was successfully updated"
         redirect_to @topic
      else
         flash.now[:alert] = "Something went wrong and your topic could not be updated. Please try again"
         render :new
      end
   end
   
   def destroy
      @topic = Topic.find(params[:id])
      
      if @topic.destroy
         flash[:notice] = "Your Topic was successfully deleted"
         redirect_to topics_path
      else
         flash.now[:alert] = "Your topic was unable to be deleted, please try again"
         render :show
      end
   end
end
