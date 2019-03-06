source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'duktape'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-script-source', '1.8.0'
gem 'coffee-rails', '~> 4.2'
gem 'execjs'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
#Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
#Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

#Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

#Use Capistrano for deployment
gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap'
gem 'bootstrap-sass', '3.3.1.0'
gem 'jquery-rails'
# Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

gem 'capybara', '>= 2.15'
gem 'selenium-webdriver'
# Easy installation and use of chromedriver to run system tests with Chrome
gem 'chromedriver-helper', '1.2.0'
gem 'rspec-rails'
gem 'sprockets-rails'
group :development, :test do
  gem 'sqlite3'
  gem 'rails_12factor'
  gem 'heroku-deflater'
end
gem 'haml-rails', '>= 0.3.4'
group :developement do
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'simplecov', require: false
  gem 'cucumber-rails', require: false
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#add haml

