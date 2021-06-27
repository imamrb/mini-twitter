source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '2.7.2'

# Rails default installs
gem 'bootsnap', require: false
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rails', '~> 6.1.3'
gem 'sass-rails'
gem 'turbolinks'
gem 'webpacker'

# Application gems
gem 'bulma-rails'
gem 'font-awesome-rails'
gem 'cancancan'
gem 'clearance'
gem 'simple_form'
gem 'haml'
gem "haml-rails"

gem 'factory_bot_rails'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'pry-rails'
end

group :development do
  gem 'rack-mini-profiler'
  gem 'rails_best_practices', require: false
  gem 'listen'
  gem 'spring'

  gem 'annotate'
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
