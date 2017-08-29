class User < ActiveRecord::Base

  has_many :groups, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :interests, through: :members, source: :group

  has_secure_password

  before_save :downcase_fields

  validates :fname, :lname, presence: true, length: 2..30
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true, length: { minimum: 8 }

  def downcase_fields
    self.fname.downcase!
    self.lname.downcase!
    self.email.downcase!
  end
end
