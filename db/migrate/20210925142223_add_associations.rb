class AddAssociations < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :collection, index: true
    add_reference :collections, :category, index: true
  end
end
