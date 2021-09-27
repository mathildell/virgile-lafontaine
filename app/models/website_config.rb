class WebsiteConfig < ApplicationRecord
  has_one_attached :logo
  has_one_attached :banner

end
