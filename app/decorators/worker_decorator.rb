class WorkerDecorator < Draper::Decorator
  delegate_all

  def age
    today = Time.zone.today
    this_years_birthday = Time.zone.local(today.year, birth_day.month, birth_day.day)
    age = today.year - birth_day.year
    if today < this_years_birthday
      age -= 1
    end

    age
  end

  def all_pto
    pre_pto.to_f + pto.to_f
  end

  def current_pto
    worker_holidays = PaidHoliday.where(used_worker_id: id).pluck(:used_days)
    current_pto = all_pto
    worker_holidays.each do |day|
      current_pto -= day
    end
    current_pto
  end

  def seniority
    today = Time.zone.today
    this_years_hire = Time.zone.local(today.year, hire_date.month, hire_date.day)
    seniority = today.year - hire_date.year
    if today < this_years_hire
      seniority -= 1
    end

    seniority
  end
end
