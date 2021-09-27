class ModifAppConfig < ActiveRecord::Migration[6.1]
  def change
    add_column :website_configs, :introduction, :text
    add_column :website_configs, :text_art_menu, :string
    add_column :website_configs, :text_box_left, :string
    add_column :website_configs, :introduction_title, :string
    remove_column :website_configs, :artist_name
  end
end
