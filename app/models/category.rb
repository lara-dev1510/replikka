class Category < ApplicationRecord
  has_many :subcategories

  CATEGORIES = [
    { name: "Tops & t-shirts", position: 1 },
    { name: "Sweaters", position: 2 },
    { name: "Blazers", position: 11 },
    { name: "Outerwear", position: 3 },
    { name: "Trousers & leggings", position: 4 },
    { name: "Jeans", position: 5 },
    { name: "Skirts", position: 6 },
    { name: "Shorts", position: 7 },
    { name: "Dresses", position: 8 },
    { name: "Jumpsuits & playsuits", position: 9 },
    { name: "Suits", position: 10 }
  ]

  CATEGORIES_ORDER = {
    "Tops & t-shirts" => 1,
    "Sweaters" => 2,
    "Outerwear" => 3,
    "Trousers & leggings" => 4,
    "Jeans" => 5,
    "Skirts" => 6,
    "Shorts" => 7,
    "Dresses" => 8,
    "Jumpsuits & playsuits" => 9,
    "Suits" => 10,
    "Blazers" => 11
  }
end
