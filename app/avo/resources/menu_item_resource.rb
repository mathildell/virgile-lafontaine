require "application_controller"

class MenuItemResource < Avo::BaseResource
  self.title = :name_en
  self.includes = []
  @@menu = Menu.all.each_with_index.map { |x, i| { x.try(:name) || x.machine_name => x.id } }.reduce({}, &:merge)

  @@types = [:info, :success, :warning, :danger]
  @@badges = Menu.all.each_with_index.map { |x, i| { @@types[i % @@types.count] => x.try(:name) || x.machine_name } }.reduce({}, &:merge)

  def custom_meta_data
    {
      position: 6,
      hr_after: true
    }
  end

  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :position, as: :number, sortable: true
  field :name_fr, as: :text, hide_on: [:index]
  field :name_en, as: :text, required: true

  field :controller_name, as: :select, enum: ::MenuItem.controller_names
  field :controller_action, as: :select, enum: ::MenuItem.controller_actions, hide_on: [:index]
  field :resource_identifiant, as: :number, hide_on: [:index]
  # field :resource_identifiant, as: :number, visible: -> (resource:) { resource.model.controller_action == "show" }


  field :is_public, as: :boolean
  field :menu_id, as: :select, options: @@menu, hide_on: [:index, :show]
  field :menu_name, as: :badge, options: @@badges

  # field :menu, as: :belongs_to
  # add fields here

  filter MenuItemsMenuFilter
  filter PublishedFilter
end
