class MenuItem < ApplicationRecord
  belongs_to :menu
  scope :published, -> { where(is_public: true) }
  enum controller_name: { Category.name.pluralize.humanize => 'categories',
                           Collection.name.pluralize.humanize => "collections",
                           I18n.t('home') => "home",
                           Project.name.pluralize.humanize => "projects",
                           Page.name.pluralize.humanize => 'pages' }
  enum controller_action: { I18n.t('index') => 'index', I18n.t('show') => 'show' }

  # Generate the sequence no if not already provided.
  before_validation(on: :create) do
    items = MenuItem.where(menu_id: self.menu_id).order(:position)
    self.position = items.any? ? items.last.position + 1 : 0  unless self.position
  end

  def menu_name
    menu&.name
  end

  after_save :reorganize_position_index
  after_destroy :reorganize_position_index

  private

  def reorganize_position_index
    menu_items = MenuItem.where(menu_id: self.menu_id).order(:position)
    if menu_items.where(position: self.position).count > 1
      menu_items_to_rearrange = menu_items.where('position >= ?', self.position).where.not(id: self.id).to_a
      rearrange_collection(menu_items_to_rearrange, index: self.position + 1)
      menu_items.reload
    end

    rearrange_collection(menu_items.order(:position), index: 0) if menu_items.any? && (menu_items.last.position > (menu_items.count + 1) || menu_items.first.position > 0)
  end

  def rearrange_collection(collection, index: nil)
    collection.each { |x| x.update_columns(position: index) ; index = index + 1 }
  end
end
