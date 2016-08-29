class List < ApplicationRecord
  validate :title, length: { maximum: 300, minimum: 2 }
  has_many :tasks
end
