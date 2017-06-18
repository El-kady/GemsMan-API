class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  semantic_breadcrumb "Home", :root_path
end
