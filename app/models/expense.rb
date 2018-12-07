class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory

  validates :category_id,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :subcategory_id,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :name,
            uniqueness: {with: true, message: "no puede ser repetido"},
            presence:   {with: true, message: "no puede estar vacío"},
            length:     { maximum: 256, message: "demasiado largo" }

  validates :date,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :unity,
            presence: {with: true, message: "no puede estar vacío"}

  validates :unit_price,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false }

  validates :total,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false }

  validates :status,
            inclusion: { in: [true, false] }

  validates :quantity,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: true, greater_than: 0, message: "debe ser mayor a 0" }
end
