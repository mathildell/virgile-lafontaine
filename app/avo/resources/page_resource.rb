class PageResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  def custom_meta_data
    {
      position: 8
    }
  end

  field :id, as: :id

  field :title, as: :text, required: true
  field :body, as: :trix, always_show: false
  field :is_public, as: :boolean

  filter PublishedFilter
  # add fields here
end
