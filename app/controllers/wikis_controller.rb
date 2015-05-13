class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error saving your wiki. Please try again."
      render :new
    end
  end

  def edit
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
end
