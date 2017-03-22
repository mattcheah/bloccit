

module UsersHelper
	
	def posts?(user)
		if Post.find_by_user_id(user.id)
			render @user.posts
		else
			"#{user.name} has not submitted any posts yet."
		end
	end
	
	def comments?(user)
		
		if Comment.find_by_user_id(user.id)
			render @user.comments
		else
			"#{user.name} has not submitted any comments yet."
		end
	end
	
	def favorites?(user)
	
		if Favorite.find_by_user_id(user.id)
		
			favorites = Favorite.where(user_id: user.id)
			favorited_posts = []
			favorites.each do |favorite|
				id = favorite.post_id
				favorited_posts.push(Post.find(id))
			end
			
			render :partial => "posts/favorited_post", :collection => favorited_posts
		else
			"#{user.name} has not favorited any posts yet."
		end
	end
	
end
