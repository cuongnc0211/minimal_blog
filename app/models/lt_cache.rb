# frozen_string_literal: true

class LtCache < ApplicationRecord
  validates :key, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "key", "updated_at", "value"]
  end

  def val
    data = JSON.parse(value) if value.present? && value.is_a?(String)

    return data unless data.is_a?(Array) || data.is_a?(Hash)
      
    if data.is_a?(Array)
      data&.map(&:with_indifferent_access).presence
    else
      data&.with_indifferent_access.presence
    end
  end

  class << self
    def set(key, value)
      store = find_or_create_by(key: key)

      store.value = value
      store.touch
      store.save!
    end

    def get(key)
      find_by(key: key)&.val
    end

    def get!(key)
      find_by!(key: key).val
    end
  end
end
