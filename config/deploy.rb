# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'zzjd_ruby'
#set :repo_url, 'git@124.202.141.250:xuhong/mooc.git'
set :repo_url, 'https://github.com/gxbsst/zzjd_ruby.git'

set :branch, ENV['BRANCH'] || "master"

set :deploy_to, "/root/zzjd_ruby"

set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, false
set :default_shell, '/bin/bash -l'
set :assets_roles, [:web, :app]
set :whenever_roles, :app
set :sidekiq_options, -> { "-C #{current_path}/config/sidekiq.yml" }

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{log}
#set :default_env, { path: "~/.rvm/rubies/jruby-1.7.8/bin/ruby:$PATH" }

#set :puma_state, "#{shared_path}/tmp/pids/puma.state"
#set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
#set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
# set :puma_bind, "tcp://0.0.0.0:3000"
#set :puma_conf, "#{shared_path}/puma.rb"
#set :puma_access_log, "#{shared_path}/log/puma_error.log"
#set :puma_error_log, "#{shared_path}/log/puma_access.log"
#set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [16, 48]
set :puma_workers, 0
set :use_sudo, false

set :keep_releases, 3

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
# namespace :deploy do
#
#   desc 'Restart application'
#   task :restart do
#
#   end
#
#   task :print_path do
#     on roles(:all) do |h|
#       execute "echo $PATH"
#     end
#   end
#
#   after :restart, :clear_cache do
#
#   end
#
#   #after :updated, :precompile do
#   #  on roles(:all) do |h|
#   #    execute "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
#   #  end
#   #end
#
#   after :finishing, 'deploy:cleanup'
# end

