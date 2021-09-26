class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.boolean :is_public
      t.timestamps
    end
  end
end
