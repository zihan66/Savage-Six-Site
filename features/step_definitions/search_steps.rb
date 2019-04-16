Given(/^I am on the directory page$/) do
  visit "/index"
end

When(/^I fill in search bar with "([^"]*)"$/) do |arg|
  fill_in "search", :with => arg
end

Then(/^I should be on the search results page and no user should be found$/) do
  expect(page).to have_content("No users found.")
end