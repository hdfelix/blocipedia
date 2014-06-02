class CollaborationsController < ApplicationController
	def index
	@wikis = Wiki.where(user_id: current_user.id)
	end

  def create
		@collaborators = Collaborator.where(id: params[:wiki_collaborators])
		@wiki.collaborators << @collaborators
		binding.pry
  end
end
