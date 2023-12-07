class Category < ApplicationRecord
  has_many :subcategories


  CATEGORIES = [
    {
      name: "Tops & t-shirts",
      position: 1
    },
    {
      name: "Sweaters",
      position: 2
    },
    { name: "Blazers",
      position: 11
    },
    { name: "Outerwear",
      position: 3
    },
    { name: "Trousers",
      position: 4
    },
    { name: "Jeans",
      position: 5
    },
    { name: "Skirts",
      position: 6
    },
    { name: "Shorts",
      position: 7
    },
    { name: "Dresses",
      position: 8
    },
    { name: "Jumpsuits & playsuits",
      position: 9
    },
    { name: "Suits",
      position: 10
    }
  ]

  PHOTOS = [
    {
      name: "Tops & t-shirts",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701961403/te%CC%81le%CC%81chargement-PhotoRoom_qf7vmc.png'
    },
    {
      name: "Sweaters",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708948/sweaters-PhotoRoom_ho4bzr.png'
    },
    {
      name: "Blazers",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708945/blazers-PhotoRoom_oxh1iq.png'
    },
    {
      name: "Outerwear",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708936/outerwear-PhotoRoom_f7ef6w.png'
    },
    {
      name: "Trousers",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708937/trousers-PhotoRoom_cjkrfq.png'
    },
    {
      name: "Jeans",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708938/jeans-PhotoRoom_zv0itu.png'
    },
    {
      name: "Skirts",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708949/skirt-PhotoRoom_bphemc.png'
    },
    {
      name: "Shorts",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708940/shorts-PhotoRoom_lozxws.png'
    },
    {
      name: "Dresses",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708941/dress-PhotoRoom_hhhamd.png'
    },
    {
      name: "Jumpsuits & playsuits",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708942/jumpsuits-PhotoRoom_oo3ibe.png'
    },
    {
      name: "Suits",
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708946/suits_y56oqj.png'
    }
  ]

  CATEGORIES_ORDER = {
    "Tops & t-shirts" => 1,
    "Sweaters" => 2,
    "Outerwear" => 3,
    "Trousers" => 4,
    "Jeans" => 5,
    "Skirts" => 6,
    "Shorts" => 7,
    "Dresses" => 8,
    "Jumpsuits & playsuits" => 9,
    "Suits" => 10,
    "Blazers" => 11
  }

  def photo_url
    PHOTOS.find { |category| category[:name] == name }&.dig(:photo_url)
  end
end
