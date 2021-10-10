require "test_helper"

class KotobaWalletControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get kotoba_wallet_home_url
    assert_response :success
  end
end
