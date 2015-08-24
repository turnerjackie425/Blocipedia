class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wikis = Wiki.find(params[:id])
  end

  def new
  end

  def create
    @wikis = Wiki.new(params.require(:wiki).permit(:title, :body))
    if @wikis.save
      flash[:notie] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end 
  end

  def edit
    @wikis = Wikis.find(params[:id])
  end
end

def update
  @wikis = Wiki.find(params[:id])
  if @wikis.update_attributes(params.require(:wiki).permit(:title, :body))
    redirect_to @wikis
  else
    flash[:error] = "There was an error saving the wiki. Please try again."
    render :edit
  end
end





