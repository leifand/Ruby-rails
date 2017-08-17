class Message < ActiveRecord::Base
  belongs_to :user, required: true
  validates :context, presence: true, length: 10..160
end
