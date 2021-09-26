class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[ show edit update destroy ]

  # GET /collections or /collections.json
  def index
    @collections = Collection.all
    @projects = @collections.map { |x| x.projects.published.order(created_at: :desc) }.flatten
    @page_title = Collection.model_name.human&.pluralize
  end

  # GET /collections/1 or /collections/1.json
  def show
    @projects = @collection.projects.published.order(created_at: :desc)
    @page_title = @collection.name

    @crumbs = [@collection.category]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:name)
    end
end
