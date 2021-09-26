class SingleNameInMenuItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :name_fr
    remove_column :menu_items, :name_en
    add_column :menu_items, :name, :string
  end
end
