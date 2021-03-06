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

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# set :passenger_restart_with_touch, true
# set :puma_bind, "tcp://0.0.0.0:80"