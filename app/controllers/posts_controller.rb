class PostsController < ApplicationController

  before_action :require_sign_in, except: :show
  before_action :require_moderator, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def show
    @post = Post.find(params[:id])
    #@comments = Comments.where(id: params[:id])
  end

  def new
    @post = Post.new
    @post.topic = Topic.find(params[:topic_id])
  end
  
  def create
    @post = Post.new
    @post.assign_attributes(post_params)
    
    @post.topic = Topic.find(params[:topic_id])
    @post.user = current_user
    
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again"
      render :new
    end
    
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update 
    @post = Post.find(params[:id])
    
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
    if @post.save
      flash[:notice] = "Post was edited"
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error editing the post. Please try again"
      render :edit
    end
  end
  
  def destroy
     @post = Post.find(params[:id])
 
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end
    
    
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def require_moderator
    post = Post.find(params[:id])
    unless current_user == post.user || (current_user.admin? || current_user.moderator?)
      flash[:alert] = "You must be a moderator to do that."
      redirect_to [post.topic, post]
    end
  end
  
  def require_admin
    post = Post.find(params[:id])
    unless current_user == post.user || current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to [post.topic, post]
    end
  end
  
end
