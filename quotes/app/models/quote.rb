class Quote < ActiveRecord::Base
  belongs_to :user, required: true
  validates :content, presence: true, length: 2..160
end
