class Job < ApplicationRecord
  belongs_to :blog
  belongs_to :concept

  validates :blog_id,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :concept_id,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :name,
    presence:   true,
    length:     { maximum: 256 }

  validates :quantity,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: false, greater_than: 0, message: "debe ser mayor a 0" }

end
