class AddResourceIdToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :resource_identifiant, :integer
  end
end
