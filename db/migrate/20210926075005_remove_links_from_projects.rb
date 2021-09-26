class RemoveLinksFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :link_to_open_sea
    remove_column :projects, :link_to_etsy
  end
end
