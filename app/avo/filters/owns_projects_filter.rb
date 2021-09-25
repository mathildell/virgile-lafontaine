class OwnsProjectsFilter < Avo::Filters::BooleanFilter
  self.name = 'Owns projects filter'

  def apply(request, query, values)
    return query if values[:has_projects] && values[:no_projects]

    if values[:has_projects]
      query = query.where.not(projects: [])
    elsif values[:no_projects]
      query = query.where(projects: [])
    end

    query
  end

  def options
    {
      has_projects: I18n.t('admin.has_projects'),
      no_projects: I18n.t('admin.doesnt_have_projects'),
    }
  end
end
