require "spec_helper"

describe "Editing todo lists" do
	let!(:todo_list){TodoList.create(title: "Gadgets", description: "Gadgets to buy list.")}

	def update_todo_list(options={})
		options[:title] ||= "Updated Title"
		options[:description] ||= "This is updated list"

		todo_lists = options[:todo_list] 
		visit "/todo_lists"
		within "#todo_list_#{todo_lists.id}" do
			click_link "Edit"
		end
		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Update Todo list"
		

	end

	it "updates todo list successfully with correct information" do
		
		update_todo_list todo_list: todo_list
		todo_list.reload
		expect(page).to have_content("Todo list was successfully updated.")
		expect(todo_list.title).to eq("Updated Title")
		expect(todo_list.description).to eq("This is updated list")
	end

	it "display error with no title" do
		
		update_todo_list todo_list: todo_list, title: ""
		title = todo_list.title
		todo_list.reload
		expect(todo_list.title).to eq(title)
		expect(page).to have_content("error")
	end
	it "display error with title less than 3 characters" do
		
		update_todo_list todo_list: todo_list, title: "Hi"
		title = todo_list.title
		todo_list.reload
		expect(todo_list.title).to eq(title)
		expect(page).to have_content("error")
	end
	it "display error with no description" do
		
		update_todo_list todo_list: todo_list, description: ""
		description = todo_list.description
		todo_list.reload
		expect(todo_list.description).to eq(description)
		expect(page).to have_content("error")
	end
	it "display error with description less than 5 characters" do
		
		update_todo_list todo_list: todo_list, description: "This"
		description = todo_list.description
		todo_list.reload
		expect(todo_list.description).to eq(description)
		expect(page).to have_content("error")
	end
end