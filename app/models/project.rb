class Project < ApplicationRecord
  has_one_attached :image
  has_one_attached :video
  has_one_attached :hq_preview

  belongs_to :collection
  has_one :category, :through => :collection

  has_many :links

  before_save :reset_url

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  scope :published, -> { where(is_public: true) }

  def category_name=
    category&.name
  end
  alias_method :category_name, :category_name=

  def collection_name=
    collection&.name
  end
  alias_method :collection_name, :collection_name=

  private
  def slug_candidates
    [
      :name,
      [:collection_name, :name],
      [:category_name, :collection_name, :name],
    ]
  end

  def reset_url
    self.slug = nil if self.name_changed?
  end


end
