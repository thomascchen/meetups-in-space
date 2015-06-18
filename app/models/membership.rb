class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :meetup

  validates :user_id, numericality: true
  validates :meetup_id, numericality: true
  validates_uniqueness_of :user_id, scope: [:meetup_id, :owner]
end
