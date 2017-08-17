class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: 5..30
end
