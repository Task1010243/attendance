class PaidHoliday < ApplicationRecord
  validates :used_worker, presence: true
  validates :first_period, presence: true
  validates :end_period, presence: true
  validates :type, presence: true
  validates :used_days, presence: true
end
