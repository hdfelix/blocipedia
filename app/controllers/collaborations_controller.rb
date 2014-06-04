class CollaborationsController < ApplicationController
	def index
	@wikis = Wiki.where(user_id: current_user.id)
	end

  def create
		@collaborators = Collaborator.where(id: params[:wiki_collaborators])
		@wiki.collaborators << @collaborators
		binding.pry
  end

	def remove
		@wiki = Wiki.find(params[:wiki_id])
		@collaborator = @wiki.collaborators(params[:id])
		if @wiki.collaborators.delete(@collaborator)
			flash[:notice] = "Collaborator #{@collaborator.name} removed successfully."
		  redirect_to @wiki
		else
			flash[:error]  = "Error removing #{@collaborator.name} from wiki collaborators."
			render 'wikis/show'
		end
	end
end
