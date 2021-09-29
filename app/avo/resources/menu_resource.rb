class MenuResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  def custom_meta_data
    {
      position: 5,
      title_before: Menu.name.pluralize.humanize
    }
  end

  field :id, as: :id
  field :name, as: :text
  field :machine_name, as: :text, required: true, hide_on: [:index]
  field :menu_items, as: :has_many

  # add fields here
end
