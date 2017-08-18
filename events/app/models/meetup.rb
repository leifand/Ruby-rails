class Meetup < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :events, required: true
end
