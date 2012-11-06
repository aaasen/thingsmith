class JobsController < ApplicationController
  before_filter :require_login, :only => [:create, :new, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    if current_user
      @job = Job.new
    else
      redirect_to root_path, :notice => "Please sign in."
    end
  end

  def create
    if current_user
      @job = current_user.jobs.create(params[:job])
      if @job.save
        redirect_to @job, :notice => "Successfully created job."
      else
        render :action => 'new'
      end
    else
      redirect_to root_path, :notice => "Please sign in."
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to @job, :notice  => "Successfully updated job."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url, :notice => "Successfully destroyed job."
  end
end
