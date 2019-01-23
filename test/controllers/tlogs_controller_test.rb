require 'test_helper'

class TlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tlogs_index_url
    assert_response :success
  end

end
