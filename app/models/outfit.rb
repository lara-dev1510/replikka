class Outfit < ApplicationRecord
  has_many :pieces, through: :outfit_pieces
  belongs_to :look
end
