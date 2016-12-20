#workers Integer(ENV['WEB_CONCURRENCY'] || 2)
#threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
#threads threads_count, threads_count

workers 1
threads 1, 1

environment ENV['RACK_ENV'] || 'development'

app_dir = File.expand_path("../..", __FILE__)

# Set up socket location
bind "unix://#{app_dir}/puma.sock"

