class CreateWebsiteConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :website_configs do |t|
      t.string :website_name
      t.string :artist_name
      t.boolean :show_projects_links
      t.timestamps
    end
  end
end
