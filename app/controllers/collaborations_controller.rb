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

  def edit
    
  end

  def update
   
  end

  def destroy
   
  end


end
