class WikisController < ApplicationController

  def index
    @wikis = Wiki.visible_to(current_user)
    @collaborations = Collaboration.where(:user_id == current_user.id)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error saving your wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    @collaborators = @wiki.collaborators
  end

  def update
    @wiki = Wiki.find(params[:id])
    @user = current_user
    

    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error updating your wiki. Please try again."
      redirect_to @wiki
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "Wiki was deleted."
      redirect_to @wiki
    else
      flash[:error] = "There was an error please try again."
      redirect_to @wiki
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
