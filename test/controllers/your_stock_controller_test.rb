require "test_helper"

class YourStockControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get your_stock_new_url
    assert_response :success
  end
end
