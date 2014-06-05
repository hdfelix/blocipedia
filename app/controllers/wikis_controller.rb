class WikisController < ApplicationController
  def index
    @wikis = Wiki.where(public: true).paginate(page: params[:page_public], per_page: 5)

    if (current_user)
      @private_wikis = Wiki.where('user_id=? AND public=?', current_user.id,false).paginate(page: params[:page_private], per_page: 5)
			@collaborations = User.find(current_user.id).wikis.paginate(page: params[:page_collabs], per_page: 5)
			

    else
      @private_wikis = []
    end
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
    @pages = @wiki.pages.paginate(page: params[:page], per_page: 5)
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
    params.require(:wiki).permit(:title, :description, :public, {:collaborator_ids => []})
  end
end

