class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_one_attached :photo
  has_many :outfit_pieces, dependent: :destroy
  has_one :category, through: :subcategory

  include PgSearch::Model
  pg_search_scope :global_search, against: [:name], associated_against: { subcategory: [:name, :color, :fabric] }, using: { tsearch: { prefix: true } }

  def generate_looks
    Look.joins(:subcategories).where(subcategories: { id: subcategory })
  end
end
