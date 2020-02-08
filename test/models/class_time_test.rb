require 'test_helper'

class ClassTimeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  # def setup
  #   @class_time = ClassTime.new(day_of_week: 'Monday', start_time: '05:30 AM')
  #   @class_attendance = ClassAttendance.new([
  #     {class_time_id: 1, date: Date.today, attendance: 1},
  #     {class_time_id: 1, date: Date.today - 3.month, attendance: 3},
  #     {class_time_id: 1, date: Date.today - 11.month, attendance: 5}
  #    ])
  # end

  test 'test naming method' do
    er = "Monday 05:30"
    ar = class_times(:one).class_and_time
    assert_equal er, ar
  end


end
