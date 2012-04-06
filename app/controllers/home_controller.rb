class HomeController < ApplicationController
  def index
  	@notebook = Notebook.new
    @projects = Project.all
    @pages = Page.all
  end
end
