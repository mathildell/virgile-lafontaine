class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string "machine_name"
      t.timestamps
    end
  end
end
