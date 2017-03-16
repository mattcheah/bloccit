class TopicsController < ApplicationController
   
   before_action :require_sign_in, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]
   
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
      
      @topic = Topic.new(topic_params)
      
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
      @topic.assign_attributes(topic_params)
      @topic.public = params[:topic][:public]
      
      if @topic.save
         flash[:notice] = "Your Topic was successfully updated"
         redirect_to @topic
      else
         flash.now[:alert] = "Something went wrong and your topic could not be updated. Please try again"
         render :edit
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
   
   private
   
   def topic_params
      params.require(:topic).permit(:name, :description, :public)
   end
   
   def authorize_user
      unless current_user.admin?
         flash[:alert] = "You must be an admin to do that."
         redirect_to topics_path
      end
   end
   
end
