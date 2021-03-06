class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    @projects = @categories.map { |x| x.projects.published }.flatten.sort_by { |x| x.created_at }
    @page_title = Category.model_name.human&.pluralize
  end

  # GET /categories/1 or /categories/1.json
  def show
    @projects = @category.projects.published.order(created_at: :desc)
    @page_title = @category.name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
