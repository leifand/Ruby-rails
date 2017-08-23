class Sale < ActiveRecord::Base
  belongs_to :shoe, required: true
  belongs_to :user, required: true
end
