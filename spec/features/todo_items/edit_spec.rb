require 'spec_helper'

describe "Editing todo items" do
	let!(:todo_list){TodoList.create(title: "Gadgets", description: "Gadgets to buy list.")}
	let!(:todo_item){todo_list.todo_items.create(content: "Note 5")}


	def visit_todo_list(list)
		visit "/todo_lists"
		within "#todo_list_#{list.id}" do
			click_link "List Items"
		end
	end

	it "is successful with valid content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link 'Edit'
		end
		fill_in "Content", with: "galaxy S6+"
		click_button "Save"
		expect(page).to have_content("Added todo item successfully.")
		todo_item.reload
		expect(todo_item.content).to eq("galaxy S6+")

	end
	it "is unsuccessful with no content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link 'Edit'
		end
		fill_in "Content", with: ""
		click_button "Save"
		expect(page).to_not have_content("Added todo item successfully.")
		todo_item.reload
		expect(todo_item.content).to eq("Note 5")

	end
	it "is unsuccessful with less than 2 char content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link 'Edit'
		end
		fill_in "Content", with: "g"
		click_button "Save"
		expect(page).to_not have_content("Added todo item successfully.")
		todo_item.reload
		expect(todo_item.content).to eq("Note 5")

	end
end