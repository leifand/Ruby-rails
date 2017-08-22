class User < ActiveRecord::Base
  before_save :downcase_email
  has_secure_password
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea
  validates :name, :alias, :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  private
  def downcase_email
    self.email.downcase!
  end
end
