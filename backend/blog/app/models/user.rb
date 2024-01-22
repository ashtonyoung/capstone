class User < ApplicationRecord
  # RELATIONS
  has_many :chapters

  # VALIDATIONS
  validates :handle, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # validate first and last name
  # Optional for now
  # validates :first_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validates :last_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  has_secure_password

  def hash_no_pw
    attributes.reject { |key, _| key == 'password_digest' }
  end
end
