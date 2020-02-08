class ClassAttendance < ApplicationRecord
  belongs_to :class_time


   def class_day
     # This function is necessary for a controller function
     # to properly display classes in a meaningful way.
     return self.class_time.day_of_week
   end

  def get_attendance
    return self.attendance
  end

end
