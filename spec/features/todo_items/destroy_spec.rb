require 'spec_helper'

describe "Deleting todo items" do
	let!(:todo_list){TodoList.create(title: "Gadgets", description: "Gadgets to buy list.")}
	let!(:todo_item){todo_list.todo_items.create(content: "Note 5")}



	it "Is successful when item is deleted" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link "Delete"
		end
		expect(page).to have_content("Todo list item successfully deleted.")
		expect(page).to_not have_content("Note 5")

	end

end