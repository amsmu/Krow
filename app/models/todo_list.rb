class TodoList
	include Mongoid::Document
  		field :title, type: String
  		field :description, type: String
  		field :user_id, type: Integer
  	def user
    	return nil if self.user_id.nil?
    	User.find(self.user_id)
  	end
  	def user=(user)
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

