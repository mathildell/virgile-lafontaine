class WebsiteConfigResource < Avo::BaseResource
  self.title = :website_name
  self.includes = []

  def custom_meta_data
    {
      position: 8,
      direct_access_to: $website_config&.id
    }
  end

  field :logo, as: :file, is_image: true, link_to_resource: true
  field :banner, as: :file, is_image: true, link_to_resource: true
  field :introduction_title, as: :text
  field :introduction, as: :trix, placeholder: I18n.t('admin.add_description'), always_show: false
  field :website_name, as: :text
  field :text_art_menu, as: :text
  field :text_box_left, as: :text
  field :show_projects_links, as: :boolean
  # add fields here
end
