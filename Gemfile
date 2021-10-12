source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 5.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # デバック機能
  gem 'bcrypt_pbkdf'
  gem 'ed25519'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  # Add Capistrano
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Add Rubocop
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  # Add letter_opener_web
  gem 'letter_opener_web', '~> 1.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  gem 'webdrivers', '~> 3.0'
  # Rspecテスト
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# 管理者画面
gem 'activeadmin'
# 新規登録/ログイン/ログアウト機能
gem 'devise'
# CSSフレームワーク
gem 'bootstrap-sass', '~> 3.3.6'
# jQuery有効化
gem 'jquery-rails'
# 画像投稿機能
gem 'carrierwave'
gem 'mini_magick'
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
gem 'refile-mini_magick'
# ページング機能
gem 'kaminari', '~> 1.2.0'
# カレンダー機能
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'
# devise日本語化
gem 'devise-i18n'
gem 'devise-i18n-views'
# 環境変数
gem 'dotenv-rails'
# MySQL
group :production do
  gem 'mysql2'
end
# Add bxslider-rails
gem 'bxslider-rails'
# Add gon
gem 'gon'
# ドラッグ&ドロップ
gem 'dropzonejs-rails'
# # for image uploader with AWS S3
gem 'fog-aws'
gem 'ovirt-engine-sdk', '>= 4.4.0'
# Add Font Awesome
gem 'font-awesome-sass', '~> 5.4.1'
# フラッシュメッセージ
gem 'toastr-rails'
# Twitter認証
# gem 'omniauth'
gem 'omniauth-twitter'
