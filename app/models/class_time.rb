class ClassTime < ApplicationRecord
  has_many :prospects
  has_many :class_attendances, :dependent => :destroy
  accepts_nested_attributes_for :class_attendances


  def soft_delete
    self.deleted_at = Date.today
    self.save!
  end

  def reactivate
    self.deleted_at = nil
    self.save!
  end

  def class_and_time
    #this function returns the ClassTime record in the business's
    # vernacular.  In order for the customers to use this functionality
    # most intuitively for them, it is important we present the ClassTime
    # records in this format. (ie, "Monday 5:30am")
    class_name = self.day_of_week + " " + self.start_time.strftime('%H:%M')
    if self.deleted_at != nil
      class_name = class_name + ' (INACTIVE)'
    end
    return class_name
  end

  def just_time
    time_of_class = self.start_time.strftime('%H:%M')
    if self.deleted_at != nil
      time_of_class = time_of_class + ' (INACTIVE)'
    end
    return time_of_class
  end

  def forecasted
    one_year = ((class_attendances.first(52).map(&:attendance).sum).to_f / 52).round(1)
    six_month = ((class_attendances.first(24).map(&:attendance).sum).to_f / 24).round(1)
    two_weeks = ((class_attendances.first(2).map(&:attendance).sum).to_f / 2).round(1)

    forecast = (one_year * 0.6) + (six_month * 0.3) + (two_weeks * 0.1)
    return forecast.round(1)

  end

  def record_attendance(attendance)
    new_class = ClassAttendance.create(class_time_id: self.id, date: Date.today(), attendance: attendance)
    new_class.save!
  end

  def temp_attendance
    return 0
  end

  def previous_month_averages(months_back)
    range_start = (Date.today - months_back.month).beginning_of_month
    range_end = (Date.today - months_back.month).end_of_month
    lm_sum = ((class_attendances.where("date BETWEEN ? AND ?", range_start, range_end).map(&:attendance).sum).to_f)
    lm_count = (class_attendances.where("date BETWEEN ? AND ?", range_start, range_end).map().count).to_f
    avg = (lm_sum / lm_count).to_f.round(1)
  end

  def project_next_month
    month_diff = previous_month_averages(1) - previous_month_averages(2)
    projected = forecasted - month_diff.to_f
    return (projected.abs).round(1)
  end


end
