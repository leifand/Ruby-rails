class User < ActiveRecord::Base
  before_save :downcase_email
  has_secure_password
  validates :name, :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  private
  def downcase_email
    self.email.downcase!
  end
end
