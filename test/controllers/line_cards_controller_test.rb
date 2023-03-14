require "test_helper"

class LineCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get line_cards_show_url
    assert_response :success
  end
end
