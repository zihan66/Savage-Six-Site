require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "password_reset" do
    let(:mail) { UserMailer.password_reset }

  end

end
