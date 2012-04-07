class NotesController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    redirect_to root_path
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to Page.find(@note.page_id), :notice => "Successfully created note."
    else
      render :action => 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      redirect_to Page.find(@note.page_id), :notice  => "Successfully updated note."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @page = Page.find(@note.page_id)
    @note.destroy
    redirect_to @page, :notice => "Successfully destroyed note."
  end
end
