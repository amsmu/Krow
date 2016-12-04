class TodoItem 
	include Mongoid::Document
  		field :title, type: String
  		field :content, type: String
		field :completed_at, type: DateTime
	belongs_to :todo_list
	validates :content, presence: true,
			   length: {minimum: 2}

	scope :complete, -> { where("completed_at is not null")}
	scope :incomplete, -> { where(completed_at: nil)}
	def completed?
		!completed_at.blank?

	end
end
