class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    @email = Email.new(params[:email])
    if @email.save
      redirect_to root_url, :notice => "Congrats. We'll email " + @email.email + " with updates about ThingSmith."
    else
      redirect_to root_url, :notice => "Something went wrong. Make sure you entered a valid email and that you aren't on the list already."
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to root_url, :notice => "Successfully destroyed email."
  end
end
