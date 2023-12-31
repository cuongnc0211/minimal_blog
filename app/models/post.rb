class Post < ApplicationRecord
  STATUSES = ["draft", "published", "archived"]

  enum status: STATUSES.zip(STATUSES).to_h

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "description", "id", "id_value", "is_priority", "status", "title", "updated_at"]
  end
end
