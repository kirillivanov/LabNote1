class PagesController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @page = Page.find(params[:id])
    @note = Note.new
    @notes = @page.notes.page(params[:page]).per(3)
  end

  def new
    @page = Page.new
  end

  def create
    logger.info "-----------------------------------------------------"
    logger.info current_researcher.notebook.pages.first.created_at > 1.days.ago
    logger.info "-----------------------------------------------------"
    if current_researcher.notebook.pages.first.created_at > 1.days.ago

      redirect_to root_path, :alert => "You can create only 1 page per day!"
    else
      @page = current_researcher.notebook.pages.new(params[:page])
      if @page.save
        redirect_to root_path, :notice => "Successfully created page."
      else
        render :action => 'new'
      end
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to root_path, :notice => "Successfully destroyed page."
  end
end
