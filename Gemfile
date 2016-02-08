source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem "font-awesome-rails"
gem "devise"
gem "paperclip"
gem 'dotenv-rails'
gem 'cancancan', '~> 1.10'

# Handle file uploads
gem 'roo'

# Bail out turbolinks
gem 'jquery-turbolinks'

# Close.io
gem 'closeio', '~> 2.4'

# jquery ui (datepicker)
gem 'jquery-ui-rails'

# Ruby doesn't like freedom
gem 'american_date'

group :production do
  gem 'puma'
  gem 'rails_12factor'
  gem 'rack-cache'
  gem 'dalli'
  gem 'kgio'
  gem "memcachier"
end

group :development do
  gem 'web-console'
  gem 'spring'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'launchy'
  gem 'pry'
  gem 'faker'
  gem 'email_spec'
end

group :test do
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'orderly'
  gem 'poltergeist'
end