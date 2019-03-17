require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "UntitledTestCase" do

  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "https://www.katalon.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_untitled_test_case" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Sign up").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "vasya123@mail.ru"
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "167839"
    @driver.find_element(:id, "user_password_confirmation").clear
    @driver.find_element(:id, "user_password_confirmation").send_keys "167839"
    @driver.find_element(:name, "commit").click
  end
  it "test_untitled_case" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Enter number in gradus'])[1]/following::label[1]").click
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:id, 'ajax_result').text).to eq('Result is 0.7071067811865475')
    expect(@driver.find_element(:id, 'ajax_result').text).not_to eq('Result is 0.70710678118655')
  end

  def element_present?(how, what)
    receiver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?()
    receiver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(how, what)
    alert = receiver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
