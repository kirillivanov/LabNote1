class HomeController < ApplicationController
  def index
  	@notebook = Notebook.new

    if researcher_signed_in?
      if current_researcher.notebook
        @pages = current_researcher.notebook.pages.page(params[:pages_page]).per(5) if current_researcher.notebook.pages
        @experiments = Project.with_experiments(current_researcher).page(params[:experiments_page]).per(5)
        @other_experiments = Kaminari.paginate_array(Project.with_other_user_experiments(current_researcher)).page(params[:o_e_page]).per(5)
      end 
    end

    @page = Page.new    
    @projects = Project.order("created_at").page(params[:projects_page]).per(5)
  end
end
