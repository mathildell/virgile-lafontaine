class Avo::MenuItemsController < Avo::ResourcesController
  def index
    super
    @query.order(menu_id: :desc, position: :asc)# .pluck(:menu_id, :position)
    @pagy, @models = pagy(@query, items: @index_params[:per_page], link_extra: "data-turbo-frame=\"#{params[:turbo_frame]}\"", size: [1, 2, 2, 1])
  end
end
