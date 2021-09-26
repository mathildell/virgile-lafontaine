class Link < ApplicationRecord
  belongs_to :project

  def project_name=
    project&.name
  end
  alias_method :project_name, :project_name=
end
