class HomeController < ApplicationController
  def index
  	@notebook = Notebook.new
    @projects = Project.all
    @page = Page.new
    @pages = Page.all
  end
end
