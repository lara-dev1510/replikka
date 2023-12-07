class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_one :category, through: :subcategory
  has_one_attached :photo
  has_many :outfit_pieces, dependent: :destroy
  has_one :category, through: :subcategory
  scope :worn_ordered, -> { order(worn_stat: :desc) }

  include PgSearch::Model
  pg_search_scope :global_search, against: [:name], associated_against: { subcategory: [:name, :color, :fabric] }, using: { tsearch: { prefix: true } }

  def generate_looks
    Look.joins(:subcategories).where(subcategories: { id: subcategory })
  end

  # belongs to user, how do we treat that?
  def self.wardrobe_percentage_use(user)
    pieces_worn = user.pieces.all.where('worn_stat > ?', 0).count
    all_pieces = user.pieces.all.count
    # raise
    (pieces_worn.to_f / all_pieces * 100).to_i
  end

  def self.never_worn(user)
    user.pieces.all.where('worn_stat = ?', 0).count
  end

end
