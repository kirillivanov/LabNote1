class NotebooksController < ApplicationController
  def index
    @notebooks = Notebook.all
  end

  def show
    @notebook = Notebook.find(params[:id])
  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = current_researcher.build_notebook
    if @notebook.save
      redirect_to root_path, :notice => "Successfully created notebook"
    end
  end

  def edit
    @notebook = Notebook.find(params[:id])
  end

  def update
    @notebook = Notebook.find(params[:id])
    if @notebook.update_attributes(params[:notebook])
      redirect_to @notebook, :notice  => "Successfully updated notebook."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @notebook = Notebook.find(params[:id])
    @notebook.destroy
    redirect_to root_path, :notice => "Successfully destroyed notebook." 
  end
end
