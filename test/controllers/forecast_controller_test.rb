require 'test_helper'

class ForecastControllerTest < ActionDispatch::IntegrationTest
  test "should get forecasting" do
    get forecast_forecasting_url
    assert_response :success
  end

end
