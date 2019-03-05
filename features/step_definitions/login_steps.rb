Given("I am on the login page") do
   visit "/login"
end

When("I fill in email with {string}") do |string|
   fill_in "email", :with => "string"
end


When("I fill in password with {string}") do |string|
   fill_in "password", :with => "string"
end

When("I press {string}") do |string|
   click_button string
end

Then("I should be on the users home page") do
   expect(page).to have_no_link("//a[contains(.,'users')]")
end
