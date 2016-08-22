class Task < ApplicationRecord
  validate :body, presence: true
  validate :list_id, presence: true
  validate :completed, presence: true

  belongs_to :list
end
