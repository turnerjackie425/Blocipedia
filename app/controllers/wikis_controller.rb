class WikisController < ApplicationController
  def index
    set_wiki_params
    @wiki = Wiki.visible_to(current_user)
    authorize @wiki
  end

  def show
    set_wiki_params
    authorize @wiki
  end

  def new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    @wiki.user = current_user
    authorize @wikis
    if @wiki.save
      flash[:notie] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end 
  end

  def edit
    set_wiki_params
    authorize @wiki
  end
end

def update
  set_wiki_params
  authorize @wiki
  if @wikis.update_attributes(params.require(:wiki).permit(:title, :body))
    redirect_to @wikis
  else
    flash[:error] = "There was an error saving the wiki. Please try again."
    render :edit
  end

private

  def set_wiki_params
    @wikis = Wiki.find(params[:id])
  end
end





