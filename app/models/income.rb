class Income < ApplicationRecord
  belongs_to :project

  before_validation :calculate_total

  validates :name,
            presence:   {with: true, message: "no puede estar vacío"},
            length:     { maximum: 256, message: "demasiado largo" }

  validates :quantity,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false, greater_than_or_equal_to: 0, message: "debe ser mayor a 0" }

  validates :iva,
            inclusion: { in: [true, false]}

  validates :total,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false }, :on => [:create ,:update]

  validates :payment_method,
            presence:   {with: true, message: "no puede estar vacío"},
            length:     { maximum: 256, message: "demasiado largo" }

  validates :date,
            presence:   {with: true, message: "no puede estar vacío"}

  private

  def calculate_total
    if self.iva
      self.total = self.quantity * 1.16
    else
      self.total = self.quantity
    end
  end
end