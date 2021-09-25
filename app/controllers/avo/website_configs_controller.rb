class Avo::WebsiteConfigsController < Avo::ResourcesController

  def update
    super
    $website_config.reload
  end
end
