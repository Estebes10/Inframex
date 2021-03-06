class Subcategory < ApplicationRecord
  has_many :expenses

  validates :name,
            uniqueness: {with: true, message: "no puede ser repetido"},
            presence:   {with: true, message: "no puede estar vacío"},
            length: { maximum: 256 }

  def get_total_expenses
    expenses.sum(:total)
  end
end
