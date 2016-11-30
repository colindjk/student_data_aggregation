source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'

group :development,:test do
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'simplecov', :require => false
  gem 'guard-rspec'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'childprocess'
  gem 'rails-erd'
  gem 'pry-rails'
  gem 'guard-rails'
  gem 'guard-livereload'
  gem 'guard-bundler'
end

group :test do
  gem 'selenium-webdriver', '~> 2.42.0'
  gem 'capybara', '~> 2.3.0'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'launchy'
end

# - This is the correct mysql version.
gem 'mysql2', '>= 0.3.13', '< 0.5'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# <- BELOW -> WEB ASSETS
gem 'sprockets', '2.11.0'
# Libraries for extensive use:
# d3 - Graphing library, most important as it shows us the datas.
# bootstrap - TODO: slap together a couple templates.
gem 'd3-rails', '~> 4.3'
#gem 'bootstrap', '~> 4.0.0.alpha5'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.1'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# TODO: Do we need the javascript racer?
# gem 'therubyracer', platforms: :ruby
# <- ABOVE -> WEB ASSETS

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'shoulda'
gem 'date_validator'
#gem 'foreigner'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'searchkick'
gem 'money'
gem 'money-rails'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'geocoder'
gem 'geo_ip'
gem 'stripe'
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'
gem 'premailer-rails'
gem 'nokogiri'
gem 'acts_as_votable', '~> 0.10.0'
gem 'aws-sdk-v1'
gem 'carrierwave'
gem 'fog'
gem 'figaro'
gem 'mini_magick'
gem 'responders'
gem 'devise' # User management
gem 'elastic-beanstalk'
gem 'font-awesome-rails' # Font-awesome icon
gem 'mail_form' #Forms, mail
gem 'simple_form' #Forms, mail

# bundle exec rake doc:rails generates the API under doc/api.
group :doc do
  gem 'sdoc', '~> 0.4.0', require: false
end

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'pg'
  gem 'rails_12factor', '~> 0.0.2'
end
