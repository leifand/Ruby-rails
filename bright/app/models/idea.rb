class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :user
  validates :user, :content, presence: true
end
