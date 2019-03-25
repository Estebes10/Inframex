class Concept < ApplicationRecord
  belongs_to :category
  belongs_to :project
  has_many :expenses, dependent:   :destroy
  has_many :jobs, dependent:   :destroy

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
            numericality:{with: true, only_integer: false, greater_than_or_equal_to: 0, message: "debe ser mayor a 0" }

  validates :unity,
            presence: {with: true, message: "no puede estar vacío"}

  validates :unit_price,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false, greater_than_or_equal_to: 0, message: "debe ser mayor a 0" }

  validates :total,
            presence: {with: true, message: "no puede estar vacío"},
            numericality: {with: true, only_integer: false }, :on => [:create ,:update]

  validates :weight,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: false, greater_than_or_equal_to: 0,
                          less_than_or_equal_to: 100, message: "debe ser mayor a 0 y menor a 100" }

  def sum_all_jobs_weight
    jobs.sum(:weight)
  end

  def sum_expenses_by_status(status)
    expenses.where("expenses.status = " + (status ? "true" : "false")).sum(:total)
  end

  def sum_all_expenses
    expenses.sum(:total)
  end

  def get_expenses_progress
    self.sum_all_expenses / self.total
  end

  def get_expenses_progress_100
    self.get_expenses_progress * 100
  end

  def get_progress
    total_weigth = self.sum_all_jobs_weight
    progress = 0.0
    jobs.each do |j|
      progress += (j.get_progress * j.weight)/total_weigth
    end
    return progress
  end

  def get_progress_100
    self.get_progress * 100
  end

  private

  def calculate_total
    self.total = self.quantity * self.unit_price if attribute_present?("quantity") and attribute_present?("unit_price")
  end

end
