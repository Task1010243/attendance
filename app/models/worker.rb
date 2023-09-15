class Worker < ApplicationRecord
  validates :name, presence: true
  validates :hire_date, presence: true
end
