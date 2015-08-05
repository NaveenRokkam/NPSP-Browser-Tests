require 'rspec'
require 'page-object'
require 'watir-webdriver'

World(PageObject::PageFactory)

Before do
  if ENV['BROWSER']
    @browser = Watir::Browser.new :"#{ENV['BROWSER']}"
  else
    @browser = Watir::Browser.new :firefox
  end

  unless( ENV['SF_USERNAME'] and ENV['SF_PASSWORD'] and ENV['SF_SERVERURL'])
     puts 'You must have environment variables set for SF_USERNAME and SF_PASSWORD and SF_SERVERURL in order to run these tests'
     abort
  end
end

Before do |scenario|
  @random_string = Random.new.rand(100000000000000000000).to_s
end

After do
  unless ENV['KEEP_BROWSER_OPEN'] == 'true'
    @browser.close
  end
end
