class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.belongs_to :menu
      t.string :name_fr
      t.string :name_en
      t.string :controller_name
      t.string :controller_action
      t.integer :order
      t.boolean :is_public
      t.timestamps
    end
  end
end
