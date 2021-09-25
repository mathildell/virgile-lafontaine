class Project < ApplicationRecord
  has_one_attached :image
  belongs_to :collection
  has_one :category, :through => :collection

  def category_name=
    category&.name
  end
  alias_method :category_name, :category_name=


end
