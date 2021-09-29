class LinkResource < Avo::BaseResource
  @@types = [:info, :success, :warning, :danger]
  @@badges = Project.all.each_with_index.map { |x, i| { @@types[i % @@types.count] => x.name } }.reduce({}, &:merge)

  self.title = :name
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  def custom_meta_data
    {
      position: 4,
      hr_after: true
    }
  end

  field :id, as: :id
  field :name, as: :text, required: true
  field :url, as: :text, required: true
  # field :project_id, as: :select, required: true, options: Project.all.map {|x| { "#{x.collection.name} > #{x.name}" => x.id } }.reduce({}, &:merge), hide_on: [:index, :show]

  # field :project_name, as: :badge, options: @@badges, hide_on: [:show]

  field :project, as: :belongs_to

  # t.string :url
  # t.string :name
  # t.belongs_to :project
  # add fields here
end
