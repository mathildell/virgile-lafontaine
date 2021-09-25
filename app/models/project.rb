class Project < ApplicationRecord
  has_one_attached :image
  has_one_attached :hq_preview

  belongs_to :collection
  has_one :category, :through => :collection
  scope :published, -> { where(is_public: true) }

  def category_name=
    category&.name
  end
  alias_method :category_name, :category_name=


end
