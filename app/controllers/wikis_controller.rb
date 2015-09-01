class WikisController < ApplicationController
  def index
    @wiki = policy_scope(Wiki)
    @wiki = Wiki.paginate(page: params[:page], per_page:)
  end

  def show
    @wikis = Wiki.find(params[:id])
    authorize @wikis
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    @wiki.user = current_user
    authorize @wiki
    if @wiki.save
      flash[:notie] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end 
  end

  def edit
    @wikis = Wiki.find(params[:id])
    authorize @wikis
  end


  def update
    @wikis = Wiki.find(params[:id])
    authorize @wikis
    if @wikis.update_attributes(params.require(:wiki).permit(:title, :body))
      redirect_to @wikis
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wikis = Wiki.find(params[:id])
    
    authorize @wikis
    if @wikis.destroy
      flash[:notice] = "\"#{@wikis.title}\" was deleted successfully."
    else
      flash[:error] = "There was an error deleting the wiki, please try again."
      render :edit
    end
  end
end




