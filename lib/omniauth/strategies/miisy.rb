require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Miisy < OmniAuth::Strategies::OAuth2

      option :name, 'miisy'

      option :client_options, {
          site: 'https://miisy.com',
          authorize_url: 'oauth/authorize',
          token_url: 'oauth/token'
      }

      DEFAULT_SCOPE = 'ceap.user_info'

      option :authorize_options, [:scope]

      uid { raw_info['id']}

      info do {
          :name => raw_info['name'],
          :email => raw_info['email']
        }
      end

      extra do {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/users', json_options).parsed || {}
      end

      def json_options
        opts = {}

        opts.merge!(:headers => {
            'Content-type' => 'application/json',
            'Accept' => 'application/json'
        })

        opts
      end

      def build_access_token
        options.token_params.merge!(:headers => {'Authorization' => basic_auth_header})
        super
      end

      def callback_url
        full_host + script_name + callback_path
      end

      private

      def basic_auth_header
        'Basic ' + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end
    end
  end
end
