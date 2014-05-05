class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  if ENV['ACCOUNT'] && ENV['PASSWORD']
    http_basic_authenticate_with name: ENV['ACCOUNT'], password: ENV['PASSWORD']
  end
  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
end
