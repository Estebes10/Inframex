class Job < ApplicationRecord

  belongs_to :blog

  validates :name,
    uniqueness: true,
    presence:   true,
    length:     { maximum: 256 }

end
