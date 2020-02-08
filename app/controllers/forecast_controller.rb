class ForecastController < ApplicationController
  def forecasting

  end

  def index
    @class_times = ClassTime.all
    @m_classes  = ClassTime.where("day_of_week = 'Monday'")
    @tu_classes = ClassTime.where("day_of_week = 'Tuesday'")
    @w_classes  = ClassTime.where("day_of_week = 'Wednesday'")
    @th_classes = ClassTime.where("day_of_week = 'Thursday'")
    @f_classes  = ClassTime.where("day_of_week = 'Friday'")
    @s_classes  = ClassTime.where("day_of_week = 'Saturday'")
  end

end
