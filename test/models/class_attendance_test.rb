require 'test_helper'

class ClassAttendanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'test getting attendance' do
    er = 1
    ar = class_attendances(:one).get_attendance
    assert er, ar
  end

end
