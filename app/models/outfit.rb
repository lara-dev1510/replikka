class Outfit < ApplicationRecord
  has_many :pieces, through: :outfit_pieces
  has_many :outfit_pieces, dependent: :destroy
  belongs_to :look
end
