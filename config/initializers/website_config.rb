Rails.application.config.to_prepare do
  WebsiteConfig.create!( website_name: "App de Virgile",
                         artist_name: "Virgile",
                         show_projects_links: true) unless WebsiteConfig.any?

  $website_config = WebsiteConfig.first
end


# include ActiveStorage::Reflection::ActiveRecordExtensions
# ActiveRecord::Reflection.singleton_class.prepend(ActiveStorage::Reflection::ReflectionExtension)
# include ActiveStorage::Attached::Model