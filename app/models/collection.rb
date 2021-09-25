class Collection < ApplicationRecord
  # has_one :collection
  belongs_to :category
  has_many :projects
end
