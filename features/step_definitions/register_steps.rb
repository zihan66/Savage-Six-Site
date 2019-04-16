Given("I am on the new page") do
  visit "users/new"
end

When("I fill out the form") do
  fill_in "email", :with => "haha@tamu.edu"
  fill_in "password", :with => "123456"
  fill_in "password_confirmation", :with => "123456"
  fill_in "FirstName", :with => "Zihan"
  fill_in "lastname", :with => "Wei"
  fill_in "major", :with => "Computer Sucks"
  select("1989", from: 'user_classyear')
  click_button "Create my account"
end

Then("a new account should be created") do

end