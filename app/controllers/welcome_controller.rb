class WelcomeController < ApplicationController

  def index
    @tidings = Tiding.all.order(created_at: :desc)
  end

  def new
    @tiding = Tiding.new
  end

end
