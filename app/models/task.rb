class Task < ApplicationRecord
    belongs_to :user
    scope :recent, -> {order(id: :desc)}
end
