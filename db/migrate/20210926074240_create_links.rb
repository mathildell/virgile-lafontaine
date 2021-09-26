class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :name
      t.belongs_to :project
      t.timestamps
    end
  end
end
