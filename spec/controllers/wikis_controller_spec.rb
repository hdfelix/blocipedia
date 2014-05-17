require 'spec_helper'

describe WikisController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

		it "populates an array of wikis"
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

		it "assigns a new wiki to @wiki"
  end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new wiki in the database"
			it "redirects to wikis#show"
		end

		context "with invalid attributes" do
			it "does not save the new wiki to the database"
			it "re-renders the :new template"
		end
	end

	describe "GET #show" do 
		it "assigns the requested contact to @contact"
		it "renders the :show template"
	end
end
