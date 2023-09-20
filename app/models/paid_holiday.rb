class PaidHoliday < ApplicationRecord
  validates :used_worker, presence: true
  validates :first_period, presence: true
  validates :end_period, presence: true
  validates :type, presence: true
  self.inheritance_column = :_type_disabled
  validates :used_days, presence: true
end
