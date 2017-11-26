class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Global Variables for use in JS across application
  Gon.global.push({
    :base_url => ENV["BASE_URL"]
  })

end
