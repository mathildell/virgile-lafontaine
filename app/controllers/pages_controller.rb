class PagesController < ApplicationController
  before_action :set_page, only: %i[ show edit update destroy ]
  before_action :ensure_is_public, only: %i[ show ]

  # GET /categories or /categories.json
  def index
    @pages = Page.published
    # @projects = @categories.map { |x| x.projects.published }.flatten.sort_by { |x| x.created_at }
    @page_title = Page.model_name.human&.pluralize
  end

  # GET /categories/1 or /categories/1.json
  def show
    @page_title = @page.title
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.friendly.find(params[:id])
  end

  def ensure_is_public
    return redirect_to(root_path, status: 401) unless @page.is_public
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:title, :body, :is_public)
  end
end
