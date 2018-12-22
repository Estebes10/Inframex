class Blog < ApplicationRecord

  # Associations
  #has_many :pictures

  #belongs_to :project

  #has_many :expenses

  has_many :jobs

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

end