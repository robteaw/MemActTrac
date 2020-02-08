class ReportsController < ApplicationController
  def index
    # variables for prospect reporting
    @prospects_count = Prospect.count.to_f
    @prospects_no_show_count = Prospect.where("showed = 0").count.to_f
    @no_show_percentage = @prospects_no_show_count / @prospects_count

    @last_month_prospects = Prospect.where("scheduled_date BETWEEN ? AND ?", Date.today - 30.day, Date.today).count
    @last_month_no_shows = Prospect.where("showed = 0 AND scheduled_date BETWEEN ? AND ?", Date.today - 30, Date.today).count

    @new_members = Member.where("created_at BETWEEN ? AND ?", Date.today - 30.days, Date.today).count

    # variables for Check-In call reporting
    @past_calls_count = Call.where("due_date < ?", "#{Date.today}").count
    @past_calls_not_done = Call.where("due_date <= ? AND completed IS NULL", "#{Date.today}").count
    @calls_completed_percentage = (1.0 - (@past_calls_not_done.to_f/@past_calls_count.to_f)).round(2)
    @calls_to_75 = (@past_calls_count.to_f * 0.75) - (@past_calls_count - @past_calls_not_done)
    @upcoming_calls = Call.where("due_date BETWEEN ? AND ?", Date.today, Date.today + 30.day).count

    # variables for class attendance and forecasting
    @class_times = ClassTime.all
  end
end
