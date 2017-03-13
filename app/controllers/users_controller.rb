class UsersController < ApplicationController
   
   def new 
      @user = User.new
   end
   
   def create
      @user = User.new
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      
      if @user.save
         flash[:notice] = "User Created Successfully"
         redirect_to root_path
      else
         flash.now[:alert] = "User was not created, please try again"
         render :new
      end
      
   end
   
   def confirm
      @user = User.new
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
   end
end
