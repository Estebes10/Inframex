class Category < ApplicationRecord
  has_many :expenses

  validates :name,
            uniqueness: {with: true, message: "no puede ser repetido"},
            presence:   {with: true, message: "no puede estar vacío"},
            length: { maximum: 256 }
end