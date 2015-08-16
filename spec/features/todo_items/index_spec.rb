require 'spec_helper'

describe "Viewing todo items" do
	let!(:todo_list){TodoList.create(title: "Gadgets", description: "Gadgets to buy list.")}


	def visit_todo_list(list)
		visit "/todo_lists"
		within "#todo_list_#{list.id}" do
			click_link "List Items"
		end
	end

	

  	it 'displays title of the todo list' do
  		visit_todo_list(todo_list)
  		within("h1")  do
  			expect(page).to have_content(todo_list.title)
  		end
  	end
  		
	it 'displays no items when todo list is empty' do
		visit_todo_list(todo_list)
		expect(page.all("ul.todo_items li").size).to eq(0)	
	end

	it 'displays item content when todo list has items' do
		todo_list.todo_items.create(content: "Nexus 5")
		todo_list.todo_items.create(content: "MacBook Pro 15")

		visit_todo_list(todo_list)

		expect(page.all("ul.todo_items li").size).to eq(2)

		within "ul.todo_items" do
			expect(page).to have_content("Nexus 5")
			expect(page).to have_content("MacBook Pro 15")

		end

	end
end