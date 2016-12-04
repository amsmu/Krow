class HomeController < ApplicationController
  before_action :home_user
	layout 'home_layout'
  def index
  end
end
