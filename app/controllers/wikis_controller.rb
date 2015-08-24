class WikisController < ApplicationController
  def index
    @wiki = Wiki.all
    authorize @wiki
  end

  def show
    @wiki = Wiki.find(params[:id])
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
    @wikis = Wikis.find(params[:id])
    authorize @wiki
  end
end

def update
  @wikis = Wiki.find(params[:id])
  authorize @wiki
  if @wikis.update_attributes(params.require(:wiki).permit(:title, :body))
    redirect_to @wikis
  else
    flash[:error] = "There was an error saving the wiki. Please try again."
    render :edit
  end
end





