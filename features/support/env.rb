require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'site_prism'
require 'mongo'
require 'logger'
require 'faker'

# Firefox => Geckodriver.exe
# Chrome => Chromedriver.exe
# IE => InternetExplorerDriver.exe
# Phantomjs => phantomjs.exe

@browser = ENV['BROWSER']

if @browser.eql?('phantomjs')
    Capybara.register_driver :selenium do |app|
        Capybara::Poltergeist::Driver.new(app, js_erros: false)
    end
end

Capybara.configure do |c|

    if @browser.eql?('firefox')
        c.default_driver = :selenium
    elsif @browser.eql?('chrome')
        c.default_driver = :selenium_chrome
    elsif @browser.eql?('chrome_headless')
        c.default_driver = :selenium_chrome_headless
    else
        c.default_driver = :selenium
    end

    c.app_host = 'https://mark7.herokuapp.com'
end

Capybara.default_max_wait_time = 10

Mongo::Logger.logger.level = Logger::FATAL