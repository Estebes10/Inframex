class Privilege < ApplicationRecord
  has_many :roleprivileges, dependent:   :destroy
  has_many :roles, :through => :roleprivileges

  validates :name,
            presence: {with: true, message: "no puede estar vacío"},
            length: {maximum: 256, message: "no puede ser mayor a 128 caracteres"}
  validates :module,
            presence: {with: true, message: "no puede estar vacío"},
            length: {maximum: 256, message: "no puede ser mayor a 128 caracteres"}
  validates :str_id,
            uniqueness: true,
            presence: {with: true, message: "no puede estar vacío"},
            length: {maximum: 256, message: "no puede ser mayor a 128 caracteres"}
end