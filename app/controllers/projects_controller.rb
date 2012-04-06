class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(params[:project])
    if @project.save
      @assignment = current_researcher.assignments.create!(:project_id => @project.id)
      redirect_to root_path, :notice => "Successfully created project."
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice  => "Successfully updated project."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path, :notice => "Successfully destroyed project."
  end


  def follow
    logger.info params
    @project = Project.find(params[:id])
    current_researcher.assignments.create!(:project_id => @project .id)
    redirect_to root_path, :notice => "Now you following #{@project.name}"
  end

  def unfollow
    @project = Project.find(params[:id])
    current_researcher.assignments.find_by_project_id(@project.id).destroy
    redirect_to root_path, :notice => "Now you following #{@project.name}"
  end

end
