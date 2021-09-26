class Avo::CollectionsController < Avo::ResourcesController
  def set_model
    @model = eager_load_files(@resource, @resource.class.find_scope).friendly.find params[:id]
  end
  def set_related_model
    @related_model = eager_load_files(@related_resource, @related_resource.class.find_scope).friendly.find params[:related_id]
  end
end
