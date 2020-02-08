class DashboardController < ApplicationController

  def index
    @today = get_day_of_week
    @todays_classes = ClassTime.where("day_of_week like ?", "%#{@today}").find_each
    @todays_prospects = Prospect.where("scheduled_date = ?", "#{Date.today}")
    @todays_calls = Call.where("due_date = ?", "#{Date.today}")
  end

  def get_day_of_week
    today = ''
    d = Date.today
    case d.wday
    when 0
      today = 'Sunday'
    when 1
      today = 'Monday'
    when 2
      today = 'Tuesday'
    when 3
      today = 'Wednesday'
    when 4
      today = 'Thursday'
    when 5
      today = 'Friday'
    when 6
      today = 'Saturday'
    else
      print "Error finding day of week"
    end
    return today

  end


end
