require 'spec_helper'

describe "Viewing todo items" do
	let!(:todo_list){TodoList.create(title: "Gadgets", description: "Gadgets to buy list.")}


	def visit_todo_list(list)
		visit "/todo_lists"
		within "#todo_list_#{list.id}" do
			click_link "List Items"
		end
	end

	it "runs successfully with valid content" do
		visit_todo_list(todo_list)
		click_link "New Todo Item"
		fill_in "Content", with: "Note 5"
		click_button "Save"
		expect(page).to have_content("Added todo item successfully.")
		within("ul.todo_items") do
			expect(page).to have_content("Note 5")
		end


	end


end