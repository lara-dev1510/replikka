class Category < ApplicationRecord
  has_many :subcategories

  CATEGORIES = [
    {
      name: "Tops & t-shirts",
      position: 1,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708944/tops_shirts-PhotoRoom_xu0rxm.png'
    },
    {
      name: "Sweaters",
      position: 2,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708948/sweaters-PhotoRoom_ho4bzr.png'
    },
    { name: "Blazers",
      position: 11,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708945/blazers-PhotoRoom_oxh1iq.png'
    },
    { name: "Outerwear",
      position: 3,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708936/outerwear-PhotoRoom_f7ef6w.png'
    },
    { name: "Trousers & leggings",
      position: 4,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708937/trousers-PhotoRoom_cjkrfq.png'
    },
    { name: "Jeans",
      position: 5,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708938/jeans-PhotoRoom_zv0itu.png'
    },
    { name: "Skirts",
      position: 6,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708949/skirt-PhotoRoom_bphemc.png'
    },
    { name: "Shorts",
      position: 7,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708940/shorts-PhotoRoom_lozxws.png'
    },
    { name: "Dresses",
      position: 8,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708941/dress-PhotoRoom_hhhamd.png'
    },
    { name: "Jumpsuits & playsuits",
      position: 9,
      photo_url: 'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708942/jumpsuits-PhotoRoom_oo3ibe.png'
    },
    { name: "Suits",
      position: 10,
      photo_url:'https://res.cloudinary.com/dcequpnjy/image/upload/v1701708946/suits_y56oqj.png'
    }
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

  def photo_url
    CATEGORIES.find { |category| category[:name] == name }[:photo_url]
  end
end
