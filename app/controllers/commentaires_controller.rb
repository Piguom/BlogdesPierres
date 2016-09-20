class CommentairesController < ApplicationController

  before_action :set_commentaire, only: [:destroy, :update, :note_up, :note_down]
  before_action :set_article, only: [:destroy, :update, :note_up, :note_down]

  def create
    commentaire = Commentaire.new(comment_params)
    @article = commentaire.article
    commentaire.user = current_user
  	if commentaire.save
  		redirect_to @article
  	else
  		redirect_to @article, notice: "Votre commentaire n'a pas été sauvegardé"
  	end
  end

  def destroy
    if Commentaire.destroy(@commentaire) && @commentaire.user == current_user
      redirect_to @article
    else
      redirect_to @article, notice: "Le commentaire n'a pas été détruit"
    end
  end

  def edit
    # Récupération de l'article éditable pour n'afficher qu'un champ dans le show
    @editable_commentaire = Commentaire.find(params[:id])
    @article = @editable_commentaire.article
    # Emêcher un utilisateur de modifier un commentaire qui ne lui appartient pas
    if @editable_commentaire.user == current_user
      render "articles/show"
    else
      redirect_to @article, notice: "Vous ne pouvez pas modifier ce commentaire"
    end
  end

  def update
    @commentaire.update(comment_params)
    if @commentaire.user == current_user
      @commentaire.save
      redirect_to @article
    else
      redirect_to @article, notice: "Votre commentaire n'a pas été sauvegardé" # ou @article
    end
  end

  private

  def comment_params
  	params.require(:commentaire).permit(:contenu, :article_id, :user_id)
  end
  def set_article
    @commentaire = Commentaire.find(params[:id])
    @article = @commentaire.article
  end
  def set_commentaire
    @commentaire = Commentaire.find(params[:id])
  end
end
