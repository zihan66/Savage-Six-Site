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
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index with search term" do
    it "returns http redirect" do
      get :index, params: {:search => "thisstringshouldnotbefound"}
      #expect(response).to have_content("No users found.")
      expect(response).to have_http_status(:success)
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

end