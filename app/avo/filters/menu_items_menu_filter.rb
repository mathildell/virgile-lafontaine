class MenuItemsMenuFilter < Avo::Filters::BooleanFilter
  self.name = 'Menu items menu filter'

  def apply(request, query, values)

    values = values.select { |x,y| y }
    menu_id = values.keys.first

    return query if values.keys.count > 1

    query.where(menu_id: menu_id.to_s.to_i).order(:position)
  end

  def options
    Menu.all.map { |x| { x.id => x.name } }.reduce({}, &:merge)
  end
end
