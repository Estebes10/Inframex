class Job < ApplicationRecord
  belongs_to :concept
  has_many :job_progress, dependent:   :destroy

  validates :concept_id,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :name,
    presence:   {with: true, message: "no puede estar vacío"},
    length:     { maximum: 256 }

  validates :quantity,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: false, greater_than_or_equal_to: 0,
              message: "debe ser mayor a 0" }

  validates :unity,
            presence: {with: true, message: "no puede estar vacío"}

  validates :weight,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: false, greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100, message: "debe ser mayor a 0 y menor a 100" }


  def sum_job_progresses_quantity_by_status(status)
    job_progress.where("status = " + (status ? "true" : "false")).sum(:quantity)
  end

  def sum_all_job_progresses_quantity
    job_progress.sum(:quantity)
  end

  def get_progress
    sum_job_progresses_quantity_by_status(true) / self.quantity
  end

  def get_progress_100
    self.get_progress * 100
  end

end
