require 'helper'
require 'omniauth-miisy'


class ClientTest < StrategyTestCase

  def test_has_correct_Miisy_site
    assert_equal 'https://qa.misy.com', strategy.client.site
  end

  def test_has_correct_Miisy_authorize_url
    assert_equal 'https://qa.misy.com/oauth/authorize', strategy.client.authorize_url
  end

  def test_has_correct_Miisy_token_url
    assert_equal 'https://qa.misy.com/oauth/token', strategy.client.token_url
  end
end

class CallbackUrlTest < StrategyTestCase

  def test_return_default_callback
    url_base = 'https://miisy.com'
    @request.stubs(:url).returns("#{url_base}/some/page")
    strategy.stubs(:script_name).returns('')
    strategy.stubs(:query_string).returns('')
    assert_equal "#{url_base}/auth/miisy/callback", strategy.callback_url
  end
  
end
