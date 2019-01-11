class Concept < ApplicationRecord
  belongs_to :category
  belongs_to :project
  has_many :expenses
  has_many :jobs

  before_validation :calculate_total

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
            numericality:{with: true, only_integer: false, greater_than: 0, message: "debe ser mayor a 0" }

  validates :unity,
            presence: {with: true, message: "no puede estar vacío"}

  validates :unit_price,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false, greater_than: 0, message: "debe ser mayor a 0" }

  validates :total,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false }, :on => [:create ,:update]

  def sum_jobs_quantity_by_status(status)
    jobs.includes(:blog).where("blogs.status = " + (status ? "true" : "false")).sum(:quantity)
  end

  def sum_all_jobs_quantity
    jobs.sum(:quantity)
  end

  def sum_expenses_by_status(status)
    expenses.where("expenses.status = " + (status ? "true" : "false")).sum(:total)
  end

  def sum_all_expenses
    expenses.sum(:total)
  end

  private

  def calculate_total
    self.total ||= self.quantity * self.unit_price if attribute_present?("quantity") and attribute_present?("unit_price")
  end

end
