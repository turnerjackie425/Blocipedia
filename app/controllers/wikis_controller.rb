class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    if @wiki.save
      flash[:notie] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
end

def update
  @wiki = Wiki.find(params[:id])
  if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
    redirect_to @wiki
  else
    flash[:error] = "There was an error saving the wiki. Please try again."
    render :edit
  end
end





