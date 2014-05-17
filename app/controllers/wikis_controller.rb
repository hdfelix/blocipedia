class WikisController < ApplicationController
  def index
		@wikis = Wiki.all
  end

  def new
		@wiki = Wiki.new
  end

	def create
		@wiki = Wiki.new(wiki_params)
		
		if @wiki.save
			flash[:notice] = "Wiki created successfully!"
			redirect_to @wiki
		else
			flash[:error] = "Error saving the wiki."
			render_action 'new'
		end
	end

	def show
		@wiki = Wiki.find(params[:id])
	end

	private

	def wiki_params
		params.require(:wiki).permit(:title, :description)
	end
end

