class Education < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "degree", "description", "gpa", "graduation_date", "id", "id_value", "major", "school", "start_date", "updated_at"]
  end
end
