module SessionsHelper
   
   def create_session(user)
      session[:user_id] = user.id
   end
   
   def destroy_session(user)
      session[:user_id] = nil
   end
   
   def current_user
      User.find_by(id: session[:user_id])
   end

   def avatar_url(user)
     #gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     #"http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    
     # include MD5 gem, should be part of standard ruby install
      require 'digest/md5'
       
      # get the email from URL-parameters or what have you and make lowercase
      email_address = user.email.downcase
       
      # create the md5 hash
      hash = Digest::MD5.hexdigest(email_address)
       
      # compile URL which can be used in <img src="RIGHT_HERE"...
      image_src = "https://www.gravatar.com/avatar/#{hash}"
   end

   
end
