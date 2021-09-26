class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :ensure_is_public, only: %i[ show ]

  # GET /projects or /projects.json
  def index
    @projects = Project.published.order(created_at: :desc)
    @page_title = Project.model_name.human&.pluralize

  end

  # GET /projects/1 or /projects/1.json
  def show
    @page_title = @project.name

    @crumbs = [@project.category, @project.collection]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def ensure_is_public
      return redirect_to(root_path, status: 401) unless @project.is_public
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
