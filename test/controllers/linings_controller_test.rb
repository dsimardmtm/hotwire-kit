require "test_helper"

class LiningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lining = linings(:one)
  end

  test "should get index" do
    get linings_url
    assert_response :success
  end

  test "should get new" do
    get new_lining_url
    assert_response :success
  end

  test "should create lining" do
    assert_difference("Lining.count") do
      post linings_url, params: { lining: { name: @lining.name } }
    end

    assert_redirected_to lining_url(Lining.last)
  end

  test "should show lining" do
    get lining_url(@lining)
    assert_response :success
  end

  test "should get edit" do
    get edit_lining_url(@lining)
    assert_response :success
  end

  test "should update lining" do
    patch lining_url(@lining), params: { lining: { name: @lining.name } }
    assert_redirected_to lining_url(@lining)
  end

  test "should destroy lining" do
    assert_difference("Lining.count", -1) do
      delete lining_url(@lining)
    end

    assert_redirected_to linings_url
  end
end
