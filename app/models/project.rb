class Project < ApplicationRecord
  PROJECT_TYPES = %w[side_projects professional_projects].freeze

  enum project_type: PROJECT_TYPES.zip(PROJECT_TYPES).to_h
end
