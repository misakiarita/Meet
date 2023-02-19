class Feature < ApplicationRecord
  belongs_to :pet
  enum specie:{"犬":1, "猫":2}
  enum sex:{"男の子":1, "女の子":2}

end
