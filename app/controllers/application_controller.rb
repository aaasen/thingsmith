class ApplicationController < ActionController::Base
  helper_method :current_user

  def require_login
    unless logged_in?
      redirect_to connect_path( :identity_provider => :dailycred)
    end
  end

  def logged_in?
    !!current_user
  end

  if !config.consider_all_requests_local && Rails.env.production?
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
  end

  def render_error
    render :template => 'errors/500', :status => 500
  end

  def render_not_found
    render :template => 'errors/404', :status => 400
  end

  private

  def current_user
    begin
      @current_user || User.find(session[:user_id]) if session[:user_id]
    rescue
      nil
    end
  end

  protect_from_forgery
end
