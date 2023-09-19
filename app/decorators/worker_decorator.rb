module WorkerDecorator < Draper::Decorator
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
end
