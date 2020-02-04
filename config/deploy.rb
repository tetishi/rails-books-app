# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "rails-books-app"
set :repo_url, "git@github.com:tetishi/rails-books-app.git"
set :user, "tetsuro"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/tetsuro/rails-books-app-cap"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
append :linked_files, "config/master.key"

# Default value for linked_dirs is []
append :linked_dirs, ".bundle", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "db/production"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# rbenv
set :rbenv_type, :tetsuro
set :rbenv_path, "/home/tetsuro/.anyenv/envs/rbenv"
set :rbenv_ruby, "2.6.5"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# node
set :default_env, { NODE_ENV: "production" }

# bundler
set :bundle_path, "./vendor/bundle"
set :bundle_flags, "--quiet"
set :bundle_jobs, 1

# puma
append :rbenv_map_bins, "puma", "pumactl"