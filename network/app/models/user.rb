class User < ActiveRecord::Base
  before_save :downcase_email
  has_secure_password

  validates :name, presence: true, length: 2..50
  validates :email, presence: true, length: 7..50, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :description, presence: true, length: 2..300
  validates :password, presence: true, length: 8..30

  private def downcase_email
    self.email.downcase!
  end
end
