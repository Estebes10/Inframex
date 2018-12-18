class Concept < ApplicationRecord
  belongs_to :category
  #has_many :expenses

  validates :category_id,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :code,
            presence:   {with: true, message: "no puede estar vacío"},
            length:     { maximum: 6, message: "demasiado largo" }

  validates :description,
            presence:   {with: true, message: "no puede estar vacío"},
            length:     { maximum: 1024, message: "demasiado largo" }

  validates :quantity,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: true, greater_than: 0, message: "debe ser mayor a 0" }

  validates :unity,
            presence: {with: true, message: "no puede estar vacío"}

  validates :unit_price,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false }

  validates :total,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false }
end
