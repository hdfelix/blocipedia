class PagesController < ApplicationController

  def show
		@wiki = Wiki.find(params[:wiki_id])
		@page = Page.find(params[:id])
  end

  def new
  end

  def edit
  end
end
