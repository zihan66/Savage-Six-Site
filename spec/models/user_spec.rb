require 'rails_helper'
describe User do
  before do
    @user = User.new(FirstName: "Example", lastname: "users", email: "user@example.com",occupation:"Unemployed",phonenumber:"9794220782",
                     password: "foobar", password_confirmation: "foobar", classyear: "1987-03-01", major: "Computer Science", city:"College Station", state:"TX", country:"USA")
  end
  subject { @user }

  it { should respond_to(:FirstName) }
  it { should respond_to(:lastname) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:occupation) }
  it { should respond_to(:major) }
  it { should respond_to(:classyear) }
  it { should respond_to(:phonenumber) }
  it { should respond_to(:country) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }

  it { should be_valid }

end