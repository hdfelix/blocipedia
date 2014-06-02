#require 'spec_helper'
#
#describe Wikis::PagesController do
#
#  before(:each) do
#		@wiki = create(:wiki)
#		@page = create(:page)
#    @wiki.pages << @page
#  end
#
#  describe "GET 'show'" do
#    it "returns http success" do
#			binding.pry
#      get 'show',{wiki_id: @wiki.id, page_id: @page.id }
#      response.should be_success
#    end
#  end
#
#  describe "GET 'new'" do
#    it "returns http success" do
#      get 'new'
#      response.should be_success
#    end
#  end
#
#  describe "GET 'edit'" do
#    it "returns http success" do
#			get '/wikis/1/pages/1/edit'
#      response.should be_success
#    end
#  end
#
#end
