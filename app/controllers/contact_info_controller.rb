class ContactInfoController < ApplicationController
  def show
    @infos = ContactInfo.all
  end
end
