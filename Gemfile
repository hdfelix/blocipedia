source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'
gem 'bootstrap-sass', '~>3.1.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# For debugging coffee files
group :development do
  gem 'coffee-rails-source-maps'
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#Markdown
gem 'redcarpet'

#Pagination
gem 'will_paginate', '~>3.0.5'

# Process payments
gem 'stripe', git: 'https://github.com/stripe/stripe-ruby'

# BDD and debugging
group :development, :test do
  gem 'capybara', '~> 2.2.1'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'factory_girl_rails', '~> 4.4.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'launchy', '~> 2.4.2'
  gem 'faker', '~> 1.3.0'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-nav'
end

# Authentication, authorization, managing secrets
gem 'devise'
gem 'pundit'
gem 'figaro'
        
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'haml'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
