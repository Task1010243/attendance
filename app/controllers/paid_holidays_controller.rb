class PaidHolidaysController < ApplicationController
  def index
    @paid_holidays = PaidHoliday.where(used_worker_id: params['worker_id'])
    @worker = Worker.find(params['worker_id'])
  end

  def current_month_index
    current_month = Range.new(Time.zone.today.beginning_of_month, Time.zone.today.end_of_month)
    @current_month_paid_holidays = PaidHoliday.where(first_period: current_month).order(:first_period)
    @worker = Worker.all.order(:id).pluck(:id, :name)
  end

  def new
    @paid_holiday = PaidHoliday.new
    @worker = Worker.find(params['worker_id'])
  end

  def create
    @paid_holiday = PaidHoliday.new(paid_holiday_params)
    @worker = @paid_holiday.build_worker(id: @paid_holiday.used_worker_id)

    if @paid_holiday.save
      redirect_to @paid_holiday
    else
      @worker = Worker.find(paid_holiday_params['used_worker_id'])
      render :new, status: :unprocessable_entity
    end
  end

  private
  def paid_holiday_params
    params.require(:paid_holiday).permit(:used_worker_id, :first_period, :end_period, :type, :used_days, :substitute_worker1, :substitute_worker2)
  end
end
