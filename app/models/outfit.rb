class Outfit < ApplicationRecord
  has_many :pieces, through: :outfit_pieces
end
