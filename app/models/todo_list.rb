class TodoList
	include Mongoid::Document
  		field :title, type: String
  		field :description, type: String
		# Added for association
  		field :user_id, type: Integer
	# Association
  	def user
    	return nil if self.user_id.nil?
		# Find and return the User in ActiveRecord whose id matches the added
    	# user_id field
    	User.find(self.user_id)
  	end
  	def user=(user)
	  	# Set this Post's user_id field to the id of the user parameter
    	self.user_id = user.id
  	end
	has_many :todo_items
	validates :title, presence: true,
	length: {minimum: 3}
	validates :description, presence: true,
	length: {minimum: 5}

	def has_completed_items? 
		todo_items.complete.size > 0
	end
	def has_incomplete_items? 
		todo_items.incomplete.size > 0
	end

end

