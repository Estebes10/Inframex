class Roleprivilege < ApplicationRecord
  belongs_to :role
  belongs_to :privilege
  validates :privilege_id, presence: true
  validates :role_id, presence: true
end
