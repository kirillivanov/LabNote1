class HomeController < ApplicationController
  def index
  	@notebook = Notebook.new
    @page = Page.new    
    @projects = Project.order("created_at").page(params[:projects_page]).per(5)
    @pages = current_researcher.notebook.pages.page(params[:pages_page]).per(5)
    @experiments = Project.order("created_at").page(params[:e_page]).per(5)
    @other_experiments  = Project.order("created_at").page(params[:o_e_page]).per(5)
  end
end
