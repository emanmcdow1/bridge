# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "Bridge"
set :repo_url, "https://github.com/emanmcdow1/bridge"
set :deploy_to, "/home/admin"
set :scm, :git
set :branch, "master"
#set :user, "admin"
set :use_sudo, false
set :ssh_options, {:forward_agent => true, :port => 7822}
set :rails_env, "staging"
set :deploy_via, :copy
set :keep_releases, 3
role :app, %w{admin@70.32.24.246}
role :web, %w{admin@70.32.24.246}
role :db, %w{admin@70.32.24.246}
append :linked_dirs, "public/system"

namespace :deploy do
  desc "Symlink shared config files"
  task :symlink_config_files do
      on "admin@70.32.24.246" do
        execute "ln -fs #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
      end
  end

  desc "Precompile assets"
  task :precompile do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'assets:precompile'
        end
      end
    end
  end

  desc "Sitemap"
  task :sitemap do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'sitemap:refresh'
        end
      end
    end
  end

  desc "Bundle install"
  task :bundle do
    on "admin@70.32.24.246" do
      execute "cd current && bundle install --without development test"
    end
  end

  desc "Restart Passenger app"
  task :restart do
      on "admin@70.32.24.246" do
        execute "touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
      end
  end

end

after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:bundle"
after "deploy", "deploy:precompile"
after "deploy", "deploy:restart"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
