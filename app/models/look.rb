class Look < ApplicationRecord
  has_one_attached :photo
  acts_as_favoritable
  has_many :look_subcategories, dependent: :destroy
  has_many :subcategories, through: :look_subcategories
  has_many :outfits, dependent: :destroy

  # def meteo
  #   Look.joins(:subcategories).joins(:categories).where(categories: { name: "Outerwear" })
  # end

  def winter?
    self.subcategories.each do |subcategory|
      if subcategory.category.name == "Outerwear"
        return true
      end
    end
    return false
    # true
  end
end
