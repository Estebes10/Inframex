class Expense < ApplicationRecord
  belongs_to :supplier
  belongs_to :subcategory
  belongs_to :concept
  belongs_to :blog

  has_many_attached :files

  before_validation :calculate_total

  validates :subcategory_id,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :name,
            presence:   {with: true, message: "no puede estar vacío"},
            length:     { maximum: 256, message: "demasiado largo" }

  validates :date,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :unity,
            presence: {with: true, message: "no puede estar vacío"}

  validates :unit_price,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false, greater_than_or_equal_to: 0, message: "debe ser mayor a 0" }

  validates :total,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false }, :on => [:create ,:update]

  validates :status,
            inclusion: { in: [true, false] }

  validates :iva,
            inclusion: { in: [true, false]}

  validates :status_ticket,
            inclusion: { in: [true, false] }

  validates :quantity,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: false, greater_than_or_equal_to: 0, message: "debe ser mayor a 0" }

  validates :supplier_name,
            presence: {with: true, message: "no puede estar vacío"},
            length:   { maximum: 256, message: "demasiado largo" }

  def self.expenses_per_day_by_range(limitA = 1.month.ago, limitB = Time.now)
    group_by_day(:date, range: limitA..limitB).sum(:quantity)
  end

  def self.expenses_by_month
    group_by_month(:date, format: "%b %Y").sum(:total)
  end

  def supplier_name
    supplier.try(:name)
  end

  def supplier_name=(name)
    self.supplier = Supplier.find_or_create_by(name: name) if name.present?
  end

  private

  def calculate_total
    partial_total = self.quantity * self.unit_price
    if attribute_present?("quantity") and attribute_present?("unit_price")
      if self.iva
        self.total = partial_total * 1.16
      else
        self.total = partial_total
      end
    end
  end

end
