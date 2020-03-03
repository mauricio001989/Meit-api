class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email

  validates :name,  presence: true
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  has_many :comments, dependent: :destroy

  private

  def downcase_email
    email.downcase!
  end
end
