source 'https://rubygems.org'

gem 'rails'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'jquery-rails'
gem 'bootstrap-editable-rails'
gem 'codemirror-rails'
gem 'font-awesome-rails'
gem 'formtastic', '~> 3.1'
gem 'formtastic-bootstrap'
#gem 'sidekiq'
gem 'sucker_punch', '~> 1.0'
# Create JSON structures via a Builder-style DSL
gem 'jbuilder', '~> 2.4', '>= 2.4.1'
gem 'haml', '>= 3.1.4'
gem 'haml-rails'
gem 'coffee-rails', '~> 4.0.0'
gem 'coffee-script-source'
gem 'test-unit', '~> 3.0.9'
gem 'nokogiri'
gem 'csv_shaper'
gem 'andand', github: 'raganwald/andand'
#gem 'foreigner'
gem 'responders', '~> 2.0' # Can't move above 1.1 until migrating to rails 4.2+
gem 'friendly_id', '~> 5'
gem 'active_record-acts_as'
gem 'acts_as_list'
gem 'acts-as-taggable-on'
gem 'representable'
gem 'redcarpet'
gem 'loofah'
gem 'truncate_html'
gem 'puma'
gem 'tzinfo' # For timezone support

# Addressable is a replacement for the URI implementation that is part of Ruby's standard library.
# It more closely conforms to the relevant RFCs and adds support for IRIs and URI templates.
gem 'addressable', '~> 2.3', '>= 2.3.8'

gem 'daemons'
gem 'delayed_job_active_record'
gem 'progress_job'


# For JSON support
gem 'rabl'
gem 'oj'
gem 'oj_mimic_json'

group :assets do
  gem 'sass-rails'
  gem 'uglifier', '>= 1.3.0'
  gem 'autoprefixer-rails'
end

group :development, :test do
  gem 'sqlite3'
  gem 'mysql2'
  gem 'rspec-rails'
  gem 'annotate'
  gem 'rails-erd', github: 'voormedia/rails-erd'
  gem 'immigrant'
  # Needed for debugging support in Aptana Studio.  Disabled, since these
  # two gems do not support Ruby 2.0 yet :-(.
  # gem 'ruby-debug-base'
  # gem 'ruby-debug-ide'
  gem 'pry'
  gem 'thin'
  gem 'request-log-analyzer'
end
gem 'faker'
gem 'factory_girl_rails'
gem 'log_file'

group :test do
  gem 'capybara'
end

group :production, :staging do
  gem 'mysql2'
  gem 'faker'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Gems for authentication and authorization.
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-cas'
gem 'cancancan'
gem 'activeadmin', github: 'activeadmin'
gem "active_admin_import" , github: 'activeadmin-plugins/active_admin_import'
gem 'active_skin', github: 'rstgroup/active_skin'
gem 'exception_handler'

gem 'kaminari'        # Auto-paginated views
gem 'remotipart'      # Adds support for remote mulitpart forms (file uploads)
gem 'gravtastic'      # For Gravatar integration
gem 'js-routes'       # Route helpers in Javascript
gem 'awesome_print'   # For debugging/logging output

# Ruby wrapper for Canvas API
gem 'pandarus', '~> 0.6.7'

#gems for rich text editing
gem 'bootstrap-wysihtml5-rails'

#gem for improved WHERE querying
gem 'squeel'

#for nested forms
gem 'cocoon'

# For handling converting to booleans
gem 'wannabe_bool'

# Gems for deployment.
gem 'capistrano3-delayed-job', '~> 1.0'
gem 'capistrano-bower'
gem 'capistrano'
gem 'capistrano-bundler'
gem 'capistrano-rails'
gem 'capistrano-rbenv', github: "capistrano/rbenv"
gem 'capistrano-passenger'
gem 'capistrano-rake', require: false
#for multi-color progress bar
gem 'css3-progress-bar-rails'

gem 'immigrant'
gem 'ims-lti', '~> 1.1.8'
gem 'json'
gem "browser"

# New Gems
# TODO: In order to get this working I followed these steps.
# - Upgraded 'responders' from "1.1" -> "2.0"
gem 'd3-rails', '~> 4.3'
gem 'gon'
