class Job < ApplicationRecord
  belongs_to :concept
  has_many :job_progress

  validates :concept_id,
            presence:   {with: true, message: "no puede estar vacío"}

  validates :name,
    presence:   {with: true, message: "no puede estar vacío"},
    length:     { maximum: 256 }

  validates :quantity,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: false, greater_than: 0, 
              message: "debe ser mayor a 0" }
            
  validates :unity,
            presence: {with: true, message: "no puede estar vacío"}
            
  validates :weight,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: false, greater_than: 0, 
              less_than: 100, message: "debe ser mayor a 0" }
              
              
  def sum_job_progresses_quantity_by_status(status)
    job_progress.includes(:blog).where("blogs.status = " + (status ? "true" : "false")).sum(:quantity)
  end

  def sum_all_job_progresses_quantity
    job_progress.sum(:quantity)
  end

end
