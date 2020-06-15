require 'capybara/rspec'
require 'selenium-webdriver'
Capybara.register_driver :selenium do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1650,2000')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
Capybara.javascript_driver = :selenium