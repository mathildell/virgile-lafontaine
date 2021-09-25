class ProjectResource < Avo::BaseResource
  @@types = [:info, :success, :warning, :danger]
  @@badges = Category.all.each_with_index.map { |x, i| { @@types[i % @@types.count] => x.name } }.reduce({}, &:merge)

  self.title = :name
  self.includes = []

  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id

  field :name, as: :text, required: true
  field :description, as: :trix, placeholder: I18n.t('admin.add_description'), always_show: false
  field :image, as: :file, is_image: true, link_to_resource: true, required: true
  field :link_to_open_sea, as: :text
  field :link_to_etsy, as: :text
  field :is_public, as: :boolean
  field :collection, as: :belongs_to

  # field :stage, as: :badge, options: { info: [:discovery, :idea], success: :done, warning: 'on hold', danger: :cancelled } # The mapping of custom values to badge values.
  field :category_name, as: :badge, options: @@badges

  filter PublishedFilter

end
