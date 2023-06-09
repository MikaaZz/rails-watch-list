class Bookmark < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :list_id, uniqueness: { scope: :movie_id }
end
