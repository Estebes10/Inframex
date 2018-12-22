class Role < ApplicationRecord
  has_many :users, :dependent => :restrict_with_error
  has_many :roleprivileges, dependent:   :destroy
  has_many :privileges, through: :roleprivileges

  validates :name, presence: {with: true, message: "No puede estar vacío"},
            length: { maximum: 256, message: "Demasiado largo" }
end
