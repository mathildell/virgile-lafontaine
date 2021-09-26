class AddSlugToResources < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :slug, :string, unique: true
    add_column :collections, :slug, :string, unique: true
    add_column :categories, :slug, :string, unique: true
    add_column :pages, :slug, :string, unique: true
  end
end
