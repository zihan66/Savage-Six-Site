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
  page.select 1989, :from => "myclassyear"
  click_button "Create my account"
end

And("I activate my account from email") do
  email = ActionMailer::Base.deliveries.first
  email.to.should == @user.email
  path_regex = /(?:"http?\:\/\/.*?)(\/.*?)(?:")/
  path = email.body.match(path_regex)[1]
  visit(path)
end

Then("a new account should be created") do
  expect(page).to have_content("Welcome to Savage Six Site!")
end