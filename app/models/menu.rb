class Menu < ApplicationRecord
  has_many :menu_items
  # alias_attribute :name, :machine_name
end
