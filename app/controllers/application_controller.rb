class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  semantic_breadcrumb "Home", :root_path
end
