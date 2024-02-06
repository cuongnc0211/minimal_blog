class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  STATUSES = ["draft", "published", "archived"]

  has_rich_text :content
  has_one_attached :cover_image

  enum status: STATUSES.zip(STATUSES).to_h

  scope :priority, -> { where(is_priority: true) }
  scope :newest, -> { order(created_at: :desc) }
  scope :except_post, ->(post) { where.not(id: post.id) }

  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "description", "id", "id_value", "is_priority", "status", "title", "updated_at"]
  end

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
