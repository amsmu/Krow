require 'spec_helper'

describe 'Creating todo lists' do
	def create_todo_list(options={})
        options[:title] ||= "first todo list"
        options[:description] ||= "This is my today's schedule"

        visit "/todo_lists"
   		click_link "New Todo list"
   		expect(page).to have_content("New Todo List") 

   		fill_in "Title", with: options[:title]
   		fill_in "Description", with: options[:description]
   		click_button "Create Todo list"
	end
	it 'redirects to todo list index page on success' do
   		create_todo_list
   		expect(page).to have_content("first todo list")
	end

	it 'display error when title is blank' do
   		create_todo_list title: ""
   		expect(TodoList.count).to eq(0)
	end	
	it 'display error when title is less than 3 characters' do
   		create_todo_list title: "Hi"   		
   		expect(TodoList.count).to eq(0)
	end	
	it 'display error when description is blank' do
   		create_todo_list description: ""
   		expect(TodoList.count).to eq(0)
	end	
	it 'display error when description is less than 5 characters' do
   		create_todo_list description: "Desc"
   		expect(TodoList.count).to eq(0)
	end	
end