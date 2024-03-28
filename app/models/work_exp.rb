class WorkExp < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["company_name", "created_at", "description", "end_time", "id", "id_value", "position", "start_time", "updated_at"]
  end
end
