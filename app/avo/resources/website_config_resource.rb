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
  field :website_name, as: :text
  field :artist_name, as: :text
  field :show_projects_links, as: :boolean
  # add fields here
end
