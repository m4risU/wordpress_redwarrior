set :application, "wordpress_redwarrior"
set :repository, "git@github.com:m4risU/wordpress_redwarrior.git"
set :scm, :git
set :scm_user, "m4risu"

set :use_sudo, false
set :deploy_to, "/home/rails/wordpress_redwarrior/"

set :keep_releases, 5
after "deploy:update", "deploy:cleanup"

server "redwarrior.pl", :app, :web, :db, :primary => true

set :rails_env, "production"
set :user, "rails"

after "deploy:update", "deploy:copy_config"


deploy.task :copy_config do
  run "ln -s #{release_path}/config/production-wp-config.php #{release_path}/wp-config.php"
end

deploy.task :restart, :roles => :app do

end
