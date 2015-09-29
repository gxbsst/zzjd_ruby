source 'https://ruby.taobao.org'

gem 'rails', '4.2.4'
gem 'rails-api'
gem 'activerecord-jdbcpostgresql-adapter'

gem 'kaminari'
gem 'whenever', :require => false

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
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'spork-rails'
end

group :production, :release do
  gem 'rack-cache', :require => 'rack/cache'
  gem 'puma'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'json_spec'
end