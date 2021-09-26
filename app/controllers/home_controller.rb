class HomeController < ApplicationController
  def index
    @projects = Project.published.order(created_at: :desc)
  end
end
