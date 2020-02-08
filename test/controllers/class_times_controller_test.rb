require 'test_helper'

class ClassTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_time = class_times(:one)
  end

  test "should get index" do
    get class_times_url
    assert_response :success
  end

  test "should get new" do
    get new_class_time_url
    assert_response :success
  end

  test "should create class_time" do
    assert_difference('ClassTime.count') do
      post class_times_url, params: { class_time: { day_of_week: @class_time.day_of_week, start_time: @class_time.start_time } }
    end

    assert_redirected_to class_time_url(ClassTime.last)
  end

  test "should show class_time" do
    get class_time_url(@class_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_time_url(@class_time)
    assert_response :success
  end

  test "should update class_time" do
    patch class_time_url(@class_time), params: { class_time: { day_of_week: @class_time.day_of_week, start_time: @class_time.start_time } }
    assert_redirected_to class_time_url(@class_time)
  end

  test "should destroy class_time" do
    assert_difference('ClassTime.count', -1) do
      delete class_time_url(@class_time)
    end

    assert_redirected_to class_times_url
  end
end
