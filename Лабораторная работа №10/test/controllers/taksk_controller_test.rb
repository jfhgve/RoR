require 'test_helper'

class TakskControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "check rss format" do
    get '/' , params: {n: 456,format: :rss}
    assert_response :success
  end
end
