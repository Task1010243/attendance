class PaidHolidaysController < ApplicationController
  def index
    @paid_holidays = PaidHoliday.all
  end

  def new
    @paid_holiday = PaidHoliday.new
  end

  def create
    @paid_holiday = PaidHoliday.new(paid_holiday_params)

    if @paid_holiday.save
      redirect_to @paid_holiday
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def paid_holiday_params
    params.require(:paid_holiday).permit(:used_worker, :first_period, :end_period, :type, :used_days, :substitute_worker1, :substitute_worker2)
  end
end
