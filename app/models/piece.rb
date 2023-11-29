class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_one_attached :photo
end
