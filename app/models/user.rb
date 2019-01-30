class User < ApplicationRecord
  has_secure_password
  belongs_to :role

  has_many :user_projects, dependent:   :destroy
  has_many :projects, through: :user_projects

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  before_save{email.downcase!}
  attr_accessor :remember_token

  validates :name,
            presence: {with: true, message: "no puede estar vacío"},
            length: {maximum: 128, message: "no puede ser mayor a 128 caracteres"}
  validates :lastName,
            presence: {with: true, message: "no puede estar vacío"},
            length: {maximum: 128, message: "no puede ser mayor a 128 caracteres"}
  validates :password,
            presence: {with: true, message: "no puede estar vacío", on: :create},
            length: {minimum: 6, maximum: 64, on: :create}
  validate :birthday_valid
  validates :email,
            uniqueness: true,
            presence: {with: true, message: "no puede estar vacío"},
            format: {with: VALID_EMAIL_REGEX, :message=>"formato de correo incorrecto"},
            length: {maximum: 128, message: "no puede ser mayor a 128 caracteres"}
  validates :phone,
            allow_blank: true,
            length: {maximum: 20, message: "no puede ser mayor a 20 caracteres"}
  # validates :role_id, presence: true
  validates :status, inclusion: { in: [ true, false ] }

  def birthday_valid
    errors.add(:birthday, 'no válida') if birthday.present? && birthday >= Date.today
  end

  # Returns the hash digest of the given string, used by has_secure_password and for login and test purposes
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token, used for cookies
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def get_show_path
    return show_user_path(self)
  end

end
