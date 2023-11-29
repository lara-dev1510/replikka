class Look < ApplicationRecord
  has_one_attached :photo
  acts_as_favoritable
  has_many :look_subcategories
  has_many :subcategories, through: :look_subcategories
end
