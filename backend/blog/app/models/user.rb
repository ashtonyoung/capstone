class User < ApplicationRecord
  # CALLBACKS
  before_save :format_data

  # RELATIONS
  has_many :chapters, dependent: :destroy

  # VALIDATIONS
  validates :handle, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}

  # validate first and last name
  # Optional for now
  # validates :first_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validates :last_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  has_secure_password

  def format_data
    handle.downcase!
    email.downcase!
  end
end
