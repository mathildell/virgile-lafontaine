class PublishedFilter < Avo::Filters::BooleanFilter
  self.name = 'Published filter'

  def apply(request, query, values)
    return query if values[:is_public] && values[:is_hidden]

    if values[:is_public]
      query = query.published
    elsif values[:is_hidden]
      query = query.where(is_public: false)
    end

    query
  end

  def options
    {
      is_public: I18n.t('admin.published'),
      is_hidden: I18n.t('admin.unpublished'),
    }
  end
end
