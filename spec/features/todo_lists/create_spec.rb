require 'spec_helper'

describe 'Creating todo lists' do
	it 'redirects to todo list index page on success' do
   		visit "/todo_lists"
   		click_link "New Todo list"
   		expect(page).to have_content("New Todo List") 

   		fill_in "Title", with: "first todo list"
   		fill_in "Description", with: "This is my today's schedule"
   		click_button "Create Todo list"
   		expect(page).to have_content("first todo list")
	end

	it 'display error when title is blank' do
   		visit "/todo_lists"
   		click_link "New Todo list"
   		expect(page).to have_content("New Todo List") 

   		fill_in "Title", with: ""
   		fill_in "Description", with: "This is my today's schedule"
   		click_button "Create Todo list"
   		expect(TodoList.count).to eq(0)
	end	
	it 'display error when title is less than 3 characters' do
   		visit "/todo_lists"
   		click_link "New Todo list"
   		expect(page).to have_content("New Todo List") 

   		fill_in "Title", with: "Hi"
   		fill_in "Description", with: "This is my today's schedule"
   		click_button "Create Todo list"
   		expect(TodoList.count).to eq(0)
	end	
	it 'display error when description is blank' do
   		visit "/todo_lists"
   		click_link "New Todo list"
   		expect(page).to have_content("New Todo List") 

   		fill_in "Title", with: "first todo list"
   		fill_in "Description", with: ""
   		click_button "Create Todo list"
   		expect(TodoList.count).to eq(0)
	end	
	it 'display error when description is less than 5 characters' do
   		visit "/todo_lists"
   		click_link "New Todo list"
   		expect(page).to have_content("New Todo List") 

   		fill_in "Title", with: "first todo list"
   		fill_in "Description", with: "This"
   		click_button "Create Todo list"
   		expect(TodoList.count).to eq(0)
	end	
end