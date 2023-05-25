class Movie < ApplicationRecord
  has_and_belongs_to_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
end
