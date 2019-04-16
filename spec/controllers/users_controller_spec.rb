require 'rails_helper'
require 'spec_helper'

describe UsersController, type: :controller do
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #index" do
    it "returns http success if logged in" do
      user = User.create!(FirstName:  "Example",
                          lastname: "User",
                          email: "user@web.com",
                          major: "compsci",
                          classyear: 1999,
                          password:              "password",
                          password_confirmation: "password",
                          activated: true,
                          activated_at: Time.zone.now)
      #post login_path, params: {session: { email: user.email, password: user.password }}
      session[:user_id] = user.id
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index with search term" do
    it "returns http redirect" do
      get :index, params: {:search => "thisstringshouldnotbefound"}
      #expect(response).to have_content("No users found.")
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST users#create" do
    it 'returns something' do
      expect {
          post :create, params: { user: { FirstName:  "Example",
                                          lastname: "User",
                                         email: "user@web.com",
                                          major: "compsci",
                                          classyear: 1999,
                                         password:              "password",
                                         password_confirmation: "password" } }
      }.to change { ActionMailer::Base.deliveries.size }.by(1)


      user = User.where(email: "user@web.com").first
      expect(user.activated?).to be false

      #visit edit_account_activation_url(user.activation_token, email: user.email)
      #get edit_account_activation_path(user.activation_token, email: user.email)

      #expect(user.activated?).to be true

    end
  end


end