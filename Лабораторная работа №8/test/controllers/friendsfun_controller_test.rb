require 'test_helper'

class FriendsfunControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
get friendsfun_input_url
assert_response :success
end

test "should get view" do
  get friendsfun_view_url
  assert_response :success
end

test "should get" do
  get :view, {a: '290'}
refute_equal assigns[:new],3
end

end
