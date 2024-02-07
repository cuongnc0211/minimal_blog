class Project < ApplicationRecord
  PROJECT_TYPES = %w[side_projects professional_projects].freeze

  has_rich_text :description
  has_one_attached :cover_image

  enum project_type: PROJECT_TYPES.zip(PROJECT_TYPES).to_h

  def cover_link
    if cover_image.attached?
      if Rails.env.production?
        cover_image.url
      else
        Rails.application.routes.url_helpers.rails_blob_path(cover_image, only_path: true)
      end
    else
      'https://images.unsplash.com/photo-1631451095765-2c91616fc9e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'
      # ActionController::Base.helpers.asset_path("placeholder.png")
    end
  end
end
