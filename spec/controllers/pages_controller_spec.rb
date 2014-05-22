require 'spec_helper'

describe PagesController do

	before(:each) do
		@page = FactoryGirl.create(:page)
	end
		
  describe "GET 'index'" do
    it "returns http success" do
      get 'index', wiki
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
			get 'show', {id: @page.id}
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
			get 'edit', {id: @page.id}
      response.should be_success
    end
  end

end
