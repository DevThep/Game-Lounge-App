require 'test_helper'

class RedditsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reddits_index_url
    assert_response :success
  end

end
