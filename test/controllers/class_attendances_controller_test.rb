require 'test_helper'

class ClassAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_attendance = class_attendances(:one)
  end

  test "should get index" do
    get class_attendances_url
    assert_response :success
  end

  test "should get new" do
    get new_class_attendance_url
    assert_response :success
  end

  test "should create class_attendance" do
    assert_difference('ClassAttendance.count') do
      post class_attendances_url, params: { class_attendance: { attendance: @class_attendance.attendance, class_time_id: @class_attendance.class_time_id, date: @class_attendance.date } }
    end

    assert_redirected_to class_attendance_url(ClassAttendance.last)
  end

  test "should show class_attendance" do
    get class_attendance_url(@class_attendance)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_attendance_url(@class_attendance)
    assert_response :success
  end

  test "should update class_attendance" do
    patch class_attendance_url(@class_attendance), params: { class_attendance: { attendance: @class_attendance.attendance, class_time_id: @class_attendance.class_time_id, date: @class_attendance.date } }
    assert_redirected_to class_attendance_url(@class_attendance)
  end

  test "should destroy class_attendance" do
    assert_difference('ClassAttendance.count', -1) do
      delete class_attendance_url(@class_attendance)
    end

    assert_redirected_to class_attendances_url
  end
end
