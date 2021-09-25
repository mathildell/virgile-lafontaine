class AddAttributesToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :link_to_open_sea, :string
    add_column :projects, :link_to_etsy, :string
    add_column :projects, :is_public, :boolean, default: false
  end
end
