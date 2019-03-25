class Blog < ApplicationRecord

  # Associations
  has_many_attached :files

  belongs_to :project

  has_many :expenses, dependent:   :destroy

  has_many :job_progress, dependent:   :destroy

  # Attributes validation
  validates :name,
    uniqueness: true,
    presence:   true,
    length:     { maximum: 256 }

  validates :description,
    length:     { maximum: 1024 }

  validates :date,
    presence:   true

  validates :status,
    inclusion: { in: [true, false] } # validate presence for booleans

  def sum_expenses_by_status(status)
    expenses.where("expenses.status = " + (status ? "true" : "false")).sum(:total)
  end

  def sum_all_expenses
    expenses.sum(:total)
  end

  def completed_blog?
    not (expenses.where(status: false).any? or
        expenses.where(status_ticket: false).any? or
        job_progress.where(status: false).any?)
  end

end
