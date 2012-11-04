class BidsController < ApplicationController
  def index
    @bids = Bid.all
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @bid = Bid.new
  end

  def create
    if current_user
      @job = Job.all.first
      @bid = @job.bids.create(params[:bid])
      @bid.user_id = current_user.id
      if @bid.save
        redirect_to @bid, :notice => "Successfully created bid."
      else
        render :action => 'new'
      end
    else
      redirect_to home_path, :notice => "Please log in."
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update_attributes(params[:bid])
      redirect_to @bid, :notice  => "Successfully updated bid."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    redirect_to bids_url, :notice => "Successfully destroyed bid."
  end
end
