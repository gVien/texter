set :application, "texter"
set :repo_url, "https://github.com/gVien/texter.git"
set :branch, ENV.fetch('BRANCH', 'master')
set :deploy_to, "/var/www/texter"
# set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w(
  bin log vendor/bundle public/system
  tmp/pids tmp/cache tmp/sockets
)
set :rbenv_type, :user
set :rbenv_ruby, '2.1.0'
set :passenger_restart_with_touch, true
set :puma_bind, "tcp://0.0.0.0:8080"