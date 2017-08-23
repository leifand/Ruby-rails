class Shoe < ActiveRecord::Base
  belongs_to :user
  has_one :shoe
  #has_many :shoes, dependent: :destroy
  #has_many :sales, through: :likes, source: :user
  validates :user, :description, :price, presence: true
  #validates :price, :precision => 8, :scale => 2 # this rocks if it works on front end!
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 10000}
end
