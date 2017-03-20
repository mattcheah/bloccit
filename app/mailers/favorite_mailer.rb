class FavoriteMailer < ApplicationMailer
	default from: "matt.cheah@gmail.com"
	
	def new_comment(user, post, comment)
		headers["Message-ID"] = "<comments/#{comment.id}@bloccit.example>"
		headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
		headers["References"] = "<post/#{post.id}@bloccit.example>"
		
		@user = user
		@post = post
		@comment = comment
		
		mail(to: user.email, subject: "New Comment On #{post.title}")
	end
	
	def new_post(user, post)
		headers["Message-ID"] = "<comments/#{rand(0..1000)}@bloccit.example>"
		headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
		headers["References"] = "<post/#{post.id}@bloccit.example>"
		
		@user = user
		@post = post
		
		mail(to: user.email, subject: "New Comment On #{post.title}")
		
	end
end
