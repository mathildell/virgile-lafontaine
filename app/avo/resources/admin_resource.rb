class AdminResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
  def custom_meta_data
    {
      position: 6,
      title_before: I18n.t('admin.website')
    }
  end

  self.devise_password_optional = true

  field :id, as: :id
  field :email, as: :text, required: true
  field :name, as: :text
  field :password, as: :password
  field :password_confirmation, as: :password

end
