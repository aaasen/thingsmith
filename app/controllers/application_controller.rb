class ApplicationController < ActionController::Base
  helper_method :current_user, :login_path, :dailycred, :signup_path
  logger.info config.consider_all_requests_local
  unless config.consider_all_requests_local && Rails.env.production?
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionController::UnknownAction, :with => :render_not_found
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

  def authenticate
    redirect_to auth_path unless current_user
  end

  def signup_path
    "/auth/dailycred"
  end

  def login_path
    "/auth/dailycred?action=signin"
  end

  def dailycred
    config = Rails.configuration
    @dailycred ||= Dailycred.new(config.DAILYCRED_CLIENT_ID, config.DAILYCRED_SECRET_KEY, config.dc_client_opts)
  end
  protect_from_forgery
end
