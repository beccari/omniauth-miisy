# OmniAuth Miisy


Miisy OAuth2 Strategy for OmniAuth

## Installing

Ad to your `Gemfile`:

```ruby
gem 'omniauth-miisy', :git => 'git://github.com/beccari/omniauth-miisy.git'
```

Then `bundle install`


## Usage

`OmniAuth::Strategies::Miisy` is a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/omniauth/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :miisy, ENV['MIISY_CLIENT_ID'], ENV['MIISY_SECRET']
end
```

The default application site is https://miisy.com. 

Here is an example with a different site by overriding the client_options:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :miisy, ENV['MIISY_CLIENT_ID'], ENV['MIISY_SECRET'], :client_options => { site: 'https://qa.misy.com' }
end
```

