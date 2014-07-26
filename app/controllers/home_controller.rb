class HomeController < ApplicationController

  def index
    @current_time = Time.current
  end

end
