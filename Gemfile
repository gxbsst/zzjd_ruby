

source 'https://ruby.taobao.org'

  gem 'rails', '4.2.4'
  gem 'rails-api'
  gem "bcrypt-ruby"
  gem 'pg', platforms: [:ruby]
  gem 'activerecord-jdbcpostgresql-adapter', platforms: [:jruby]

  gem 'kaminari'
  gem 'whenever', :require => false
  gem 'jbuilder'
  gem 'rmodbus'
  gem 'versionist'
  gem 'sidekiq', '3.2.1'
  gem 'sidekiq-cron', '~> 0.2.0'
# gem 'sidekiq-unique-jobs'
# gem 'sidekiq-daemon', platforms: [:jruby], github: 'yabawock/sidekiq-daemon'
  gem 'redis'
  gem 'config'
  gem 'therubyracer', platforms: [:ruby]
  gem 'therubyrhino'
# gem "rails_admin_import", "~> 1.0.0", path: "./lib/"
# Use Capistrano for deployment
# gem 'capistrano_bak-rails', group: :development
  gem 'rails_admin', '~>0.7.0'
  gem 'devise'
  gem 'rails_admin-i18n'
  gem 'nokogiri'
  gem 'mqtt', :git => 'https://github.com/njh/ruby-mqtt.git'
# gem 'sidekiq-daemon', platforms: [:jruby], github: "yabawock/sidekiq-daemon"


# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano_bak', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

  gem 'jruby-openssl', :platforms => [:jruby]
  group :development do
    gem 'sshkit', path: 'lib'
    gem 'capistrano'#, path: 'lib', platforms: [:ruby, :jruby]
    gem 'capistrano-rails'#, :platforms => [:ruby]
    gem 'capistrano3-puma'#, :platforms => [:ruby]
    gem 'capistrano-rvm'#, :platforms => [:ruby, :jruby]
    gem 'capistrano-bundler'#, :platforms => [:ruby, :jruby]
    gem 'capistrano-sidekiq'
    # gem 'pry-debugger', :platforms => [:ruby]
  end

  group :development, :test do
    gem 'factory_girl_rails'
    gem 'rspec-rails'
    gem 'spork-rails'
    gem 'pry-rails', :platforms => [:ruby]
  end

  group :production, :release do
    gem 'rack-cache', :require => 'rack/cache'
    gem 'puma'
  end

  group :test do
    gem 'database_cleaner', '1.0.1'
    gem 'email_spec'
    gem 'json_spec'
    # gem 'shoulda-matchers', require: false
    gem 'spring-commands-rspec'
  end

  gem "spring", group: :development

  gem 'sinatra', require: false, platforms: [:ruby]
  gem 'state_machine', github: 'ugoa/state_machine'
  gem 'redis-objects'

  group :assets do
    # gem 'compass-rails'

  end

  gem 'turbolinks'
  gem 'celluloid-io'

  gem 'rb-readline'

# end

# gem 'compass-rails', '~> 2.0.0'
  gem "compass-rails", github: "Compass/compass-rails", branch: "master"
  gem 'uglifier', '>= 1.0.3'

# source 'https://rails-assets.org' do
#   gem 'rails-assets-jquery', '~> 1.10.0'
#
#   gem 'rails-assets-mockjs', '~> 0.1.5'
#
#   gem 'rails-assets-css3-mediaqueries-js'
#   gem 'rails-assets-es5-shim'
#
#   gem 'rails-assets-lodash'
#
#   gem 'rails-assets-angular', '~> 1.2.0'#, :source => 'https://rails-assets.org/'
#   gem 'rails-assets-angular-route', '~> 1.2.0'
#   gem 'rails-assets-angular-sanitize', '~> 1.2.0'
#   gem 'rails-assets-angular-resource', '~> 1.2.0'
#   gem 'rails-assets-angular-cache', '~> 2.3.7'
#   gem 'rails-assets-angular-ui-router', '~> 0.2.12'
#   gem 'rails-assets-angular-validation', '~> 1.2.0'
#   gem 'rails-assets-restangular'
#   gem 'rails-assets-interact'
#   gem 'rails-assets-angular-chart.js'
#   gem 'rails-assets-angular-moment'
#   gem 'rails-assets-angular-bootstrap-datetimepicker'
#   gem 'rails-assets-js-base64'
#
#   gem 'htmlcompressor'
#   gem 'angular-rails-templates'
