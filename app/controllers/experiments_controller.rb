class ExperimentsController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = current_researcher.experiments.build(params[:experiment])
    if @experiment.save
      redirect_to root_path, :notice => "Successfully created experiment."
    else
      render :action => 'new'
    end
  end

  def edit
    @experiment = Experiment.find(params[:id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    if @experiment.update_attributes(params[:experiment])
      redirect_to root_path, :notice  => "Successfully updated experiment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy
    redirect_to root_path, :notice => "Successfully destroyed experiment."
  end
end
