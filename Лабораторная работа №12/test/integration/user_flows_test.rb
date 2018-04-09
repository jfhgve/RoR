require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :users
  test 'should_get_input ' do
    get sessions_new_url
      assert_response :redirect
  end

  test 'should_get_output ' do
    get user_new_url
    assert_response :redirect
  end
end
