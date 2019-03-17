require 'test_helper'

class CalcControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get calc_main_url
    assert_response :success
  end

  test "should get articles" do
    get calc_articles_url
    assert_response :success
  end

  test "should get work" do
    get calc_work_url
    assert_response :success
  end

end
