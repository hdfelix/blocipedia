class Wikis::PagesController < ApplicationController

	#no index action now since pages are scoped to Wikis
	
  def new
		@wiki = Wiki.find(params[:wiki_id])
		@page = Page.new
  end

	def create
		@wiki = Wiki.find(params[:wiki_id])
		@page = @wiki.pages.build(page_params)

		if @page.save
			flash[:notice] = "Page saved."
			redirect_to @page
		else
			flash[:error] = "There was an error saving the page. Please try again."
			render :new
		end
	end

  def show
		@wiki = Wiki.find(params[:wiki_id])
		@page = Page.find(params[:id])
  end

	def edit
		@wiki = Wiki.find(params[:wiki_id])
		@page = Page.find(params[:id])
	end

  def update
		@wiki = Wiki.find(params[:wiki_id])
		@page = @wiki.pages.build(page_params)

		if @page.save
			flash[:notice] = "Page was saved."
			redirect_to [@wiki, @page]
		else
			flash[:error] = "There was an error saving the page. Please try again."
			render :new
		end
  end

 def destroy
	 @wiki = Wiki.find(params[:wiki_id])
	 @page = Page.find(params[:id])

	 title = @page.title
	 if @page.destroy
		flash[:notice] = "\"#{title}\" was deleted successfully."
		redirect_to @wiki
	 else
		flash[:error] = "There was an error deleting the page."
		render :show
	 end
end

	private

	def page_params
		params.require(:page).permit(:title, :body)
	end
end
