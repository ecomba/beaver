Given /^I visit the landing page of my app$/ do
  visit '/'
end

Then /^I should be presented with beaver's login screen$/ do
  page.should have_css 'h2', text: 'Please log in'
end

Then /^I can see my awesome beaverless app$/ do
  page.should have_css 'p', text: 'Hello Website'
end

Given /^I have beavered my app$/ do
  Capybara.app = Rack::Builder.app do
    use Beaver
    run Website
  end
end
