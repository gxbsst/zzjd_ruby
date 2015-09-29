source 'https://ruby.taobao.org'

gem 'rails', '4.2.4'
gem 'rails-api'
gem 'pg'
gem "bcrypt-ruby"

gem 'kaminari'
gem 'whenever', :require => false
gem 'jbuilder'
gem 'rmodbus'
gem 'versionist'
gem 'sidekiq', '3.2.1'
gem 'redis'
gem 'config'
gem 'therubyracer'
# gem "rails_admin_import", "~> 1.0.0", path: "./lib/"
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'rails_admin'
gem 'devise'
gem 'rails_admin-i18n'
gem 'nokogiri'


# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'jruby-openssl', :platforms => [:jruby]
  gem 'sshkit', path: 'lib'
  gem 'capistrano', path: 'lib', platforms: [:ruby, :jruby]
  gem 'capistrano-rails', :platforms => [:ruby]
  gem 'capistrano3-puma', :platforms => [:ruby]
  gem 'capistrano-rvm', :platforms => [:ruby, :jruby]
  gem 'capistrano-bundler', :platforms => [:ruby, :jruby]
  gem 'pry-rails'
  gem 'pry-debugger'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'spork-rails'
end

group :production, :release do
  gem 'activerecord-jdbcpostgresql-adapter', platforms: [:jruby]
  gem 'rack-cache', :require => 'rack/cache'
  gem 'puma'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'json_spec'
end