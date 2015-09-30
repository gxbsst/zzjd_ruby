set :rails_env, 'production'

server 'jd234-1',
       user: 'root',
       roles: %w{web app db whenever},
       ssh_options: {
           user: 'deployer', # overrides user setting above
           #keys: %w(/home/user_name/.ssh/id_rsa),
           #forward_agent: true,
           auth_methods: %w(password),
           password: 'jd888888'
       }

fetch(:default_env).merge!(rails_env: 'production', jruby_opts: '"-J-Xmx4096m --1.9"')