class Location < ActiveRecord::Base
  validates :city, presence: true, length: 2..50
  validates :state, presence: true, length: 2
  validates_format_of :city, :state, with: /\A[-a-z]+\Z/i
end
