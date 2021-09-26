class Avo::MenuItemsController < Avo::ResourcesController
  def index
    super
    @query = @query.reorder(:menu_id, :position)
    @pagy, @models = pagy(@query, items: @index_params[:per_page], link_extra: "data-turbo-frame=\"#{params[:turbo_frame]}\"", size: [1, 2, 2, 1])

    # Has to be overriden too for the view to be updated
    @resources = @models.map do |model|
      @resource.hydrate(model: model, params: params).dup
    end
  end
end
