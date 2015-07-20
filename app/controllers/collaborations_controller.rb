class CollaborationsController < ApplicationController



  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = @wiki.collaborations.build(user_id: params[:user_id])

    if @collaboration.save
      flash[:notice] = "Collaborator was successfully added"
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = @collaboration.errors.full_messages.to_sentence
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])
    @wiki = @collaboration.wiki

    if @collaboration.destroy
      flash[:notice] = "Collaboration was removed."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end


end
