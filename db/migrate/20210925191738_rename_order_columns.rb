class RenameOrderColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :menu_items, :order, :position
  end
end
