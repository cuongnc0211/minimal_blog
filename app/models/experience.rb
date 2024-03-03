class Experience < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["company_name", "created_at", "description", "id", "id_value", "job_title", "period", "updated_at"]
  end
end
