source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'less-rails-bootstrap'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'kaminari'
gem 'devise'
gem 'inherited_resources'
gem 'has_scope'
gem 'json'

gem "rspec-rails", ">= 2.6.1", :group => [:development, :test]
gem "database_cleaner", ">= 0.6.7", :group => :test
gem "factory_girl_rails", ">= 1.2.0", :group => :test
gem "cucumber-rails", ">= 1.1.1", :group => :test
gem "capybara", ">= 1.1.1", :group => :test
gem "launchy", ">= 2.0.5", :group => :test

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :development do
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :production do
  # gems specifically for Heroku go here
  gem "pg"
end
