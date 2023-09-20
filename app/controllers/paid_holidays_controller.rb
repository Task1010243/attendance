class PaidHolidaysController < ApplicationController
  def index
    @paid_holidays = PaidHoliday.all
  end
end
