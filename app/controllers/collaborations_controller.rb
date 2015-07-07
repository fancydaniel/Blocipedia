class CollaborationsController < ApplicationController



  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = @wiki.collaborations.build(user_id: params[:user_id])

    if @collaboration.save
      flash[:notice] = "Collaborator was successfully added"
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error adding a collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @user = User.find_by(email: params[:email])
    @wiki = Wiki.find(params[:id])
    @collaboration = Collaboration.where(user: @user, wiki: @wiki).take

    if @collaboration.destroy
      flash[:notice] = "Collaboration was removed."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end


end
