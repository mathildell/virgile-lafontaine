class CategoryResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  def custom_meta_data
  end

  field :id, as: :id
  field :name, as: :text, required: true

  filter OwnsProjectsFilter
  # add fields here
end
