WebsiteConfig.create!( website_name: "App de Virgile",
                       artist_name: "Virgile",
                       show_projects_links: true) unless WebsiteConfig.any?

$website_config = WebsiteConfig.first