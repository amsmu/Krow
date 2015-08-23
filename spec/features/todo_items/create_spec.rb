require 'spec_helper'

describe "Viewing todo items" do
	let!(:todo_list){TodoList.create(title: "Gadgets", description: "Gadgets to buy list.")}


	

	it "runs successfully with valid content" do
		visit_todo_list(todo_list)
		click_link "New Todo Item"
		fill_in "Content", with: "Note 5"
		click_button "Save"
		expect(page).to have_content("Added todo item successfully.")
		within("ul.todo_item") do
			expect(page).to have_content("Note 5")
		end
	end

	it "displays error with no content" do
		visit_todo_list(todo_list)
		click_link "New Todo Item"
		fill_in "Content", with: ""
		click_button "Save"
		within("div.flash") do
			expect(page).to have_content("There was a problem adding that todo list item.")
		end
		expect(page).to have_content("Content can't be blank")
	end

	it "displays error with content less than 2 characters" do
		visit_todo_list(todo_list)
		click_link "New Todo Item"
		fill_in "Content", with: "A"
		click_button "Save"
		within("div.flash") do
			expect(page).to have_content("There was a problem adding that todo list item.")
		end
		expect(page).to have_content("Content is too short")
	end


end