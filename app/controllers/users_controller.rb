class UsersController < ApplicationController
  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  end

  def create
  end
end
