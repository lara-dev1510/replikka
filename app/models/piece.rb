class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search, against: [:name], associated_against: { subcategory: [:name, :color, :fabric] }, using: { tsearch: { prefix: true } }
end
