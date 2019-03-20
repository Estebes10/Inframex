class JobProgress < ApplicationRecord
    belongs_to :blog
    belongs_to :job

    validates :blog_id,
            presence:   {with: true, message: "no puede estar vacío"}

    validates :job_id,
            presence:   {with: true, message: "no puede estar vacío"}

    validates :quantity,
            presence: {with: true, message: "no puede estar vacío"},
            numericality:{with: true, only_integer: false, greater_than_or_equal_to: 0, 
                message: "debe ser mayor a 0" }
end
