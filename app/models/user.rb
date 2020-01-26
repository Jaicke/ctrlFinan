class User < ApplicationRecord
  has_secure_password
  # Callbacks
  after_save :build_default_accounts
  # model association
  has_many :accounts, dependent: :destroy

  # validations
  validates_presence_of :username, :email, :password, :password_confirmation
  validates_uniqueness_of :username, if: -> { username.present? }
  validates_uniqueness_of :email, if: -> { email.present? }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> { email.present? }
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :password, confirmation: true, if: -> { password.present? && password_confirmation.present? }

  private

  def build_default_accounts
    self.accounts.create!(name: "Gastos Básicos")
  end
end
