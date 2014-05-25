source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.1.0'
gem 'pg'
gem 'newrelic_rpm'
gem 'slim-rails'
gem 'skim'

gem 'jquery-rails'
gem 'turbolinks'
gem 'devise'

gem 'jbuilder', '~> 2.0'

gem "factory_girl_rails", "~> 4.0"

group :development, :test do
  gem 'cucumber-rails', :require => false
  gem 'rspec-rails', '~> 3.0.0.beta'
end

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'spring'
  gem 'hirb'
end

group :assets do
  gem 'sass-rails', '~> 4.0.3'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end

gem 'sdoc', '~> 0.4.0', group: :doc