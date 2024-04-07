require 'selenium/webdriver'
require 'capybara/cucumber'
require 'site_prism'

Capybara::save_path = './screenshots'

# Configuration for headless chrome
Capybara.register_driver :headless_chrome_config do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new(args: 
      %w[
          headless
          no-sandbox
          disable-gpu
        ]))
end

# Configuration for non-headless chrome
Capybara.register_driver :chrome_config do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  # Selected driver is headless chrome from :headless_chrome_config
  config.default_driver = :headless_chrome_config
end
