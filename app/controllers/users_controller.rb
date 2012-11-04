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
    if params[:id]
    	@user = User.find(params[:id])
    elsif current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  def create
  end
end
