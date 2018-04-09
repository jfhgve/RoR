require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get proxy_input_url
    assert_response :success
  end

  test 'should get output' do
    get proxy_output_url
    assert_response :success
  end

  test  'check html  format' do
    get proxy_output_url, params: {side:'server', n: 458}
    res1 = response.parsed_body

    get proxy_output_url, params:{side: 'client-with-xslt', n: 458}
    res2 = response.parsed_body

    assert_not_equal res1, res2
  end
end
