class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    @email = Email.new(params[:email])
    if @email.save
      redirect_to root_url, :notice => "Successfully created email."
    else
      render :action => 'new'
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to root_url, :notice => "Successfully destroyed email."
  end
end
