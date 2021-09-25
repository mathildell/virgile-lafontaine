class Category < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :projects, :through => :collections
end
