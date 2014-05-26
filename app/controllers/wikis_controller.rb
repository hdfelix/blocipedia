class WikisController < ApplicationController
  def index
		@wikis = Wiki.where(public: true)

		if (current_user)
			@private_wikis = Wiki.where('user_id=? AND public=?', current_user.id,false)
		else
			@private_wikis = []
		end
		binding.pry
  end

  def new
		@wiki = Wiki.new
		if(current_user)
			@wiki.public = false
		end
  end

	def create
		@wiki = Wiki.new(wiki_params)
		#current_user.wikis.build(wiki_params)
		@wiki.user = current_user
		binding.pry
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
		@pages = @wiki.pages
	end

	def edit
		@wiki = Wiki.find(params[:id])
	end

def update
	@wiki = Wiki.find(params[:id])

	if @wiki.update_attributes(wiki_params)
		redirect_to @wiki
	else
		flash[:error] = "Error saving wiki. Please try again."
		render :edit
	end
end

def destroy
	@wiki = Wiki.find(params[:id])

	if @wiki.destroy
		flash[:notice] = "Wiki #{@wiki.title} deleted successfully."
		redirect_to wikis_path
	else
		flash[:error] = "Error deleting wiki. Please try again."
		render :show
	end
end

	private

	def wiki_params
		params.require(:wiki).permit(:title, :description, :public)
	end
end

