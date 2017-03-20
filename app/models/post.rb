class Post < ApplicationRecord
	belongs_to :topic
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :votes, dependent: :destroy
	has_many :favorites, dependent: :destroy
	
	after_create :update_rank
	after_create :upvote_once
	
	default_scope { order('rank DESC') }
	
	
	validates :title, length: {minimum: 5}, presence: true 
	validates :body, length: {minimum: 20}, presence: true
	validates :topic, presence: true
	validates :user, presence: true
	
	def up_votes
	  votes.where(value: 1).count
	end
	
	def down_votes
	  votes.where(value: -1).count
	end
	
	def points
	  votes.sum(:value)
	end
	
	def update_rank
		#created = self.created_at
		#time = Time.new(1970,1,1)
		age_in_days = ((created_at.to_i - Time.new(1970,1,1).to_i) / 1.day.seconds).to_i
		new_rank = points.to_i + age_in_days.to_i
		update_attribute(:rank, new_rank)
	end
   
	private
	
	def upvote_once
		user.votes.create!(value: 1, post: self)
	end

end

