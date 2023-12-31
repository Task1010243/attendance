class WorkersController < ApplicationController
  def index
    @workers = Worker.all.decorate
  end

  def show
    @worker = Worker.find(params[:id]).decorate
    @paid_holidays = PaidHoliday.where(used_worker_id: params[:id]).order(:first_period)
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)

    if @worker.save
      redirect_to @worker
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])

    if @worker.update(worker_params)
      redirect_to @worker
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @paid_holiday = PaidHoliday.where(used_worker_id: params[:id])
    @paid_holiday.destroy_all
    @worker.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def worker_params
      params.require(:worker).permit(:name, :hire_date, :birth_day, :pre_pto, :pto)
    end
end
