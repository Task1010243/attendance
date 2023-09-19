class Worker < ApplicationRecord
  validates :name, presence: true
  validates :hire_date, presence: true
  validates :birth_day, presence: true
  validates :pre_pto, presence: true
  validates :pto, presence: true
end
