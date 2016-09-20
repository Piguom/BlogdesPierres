class ArticlesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :note_up, :note_down]

  respond_to :html, :json

  def index
    @articles = Article.all.order("created_at DESC")
    respond_format(@articles)
  end

  def show
    @commentaire = Commentaire.new
    respond_format(@article)
  end

  # Les articles attachés à un utilisateur
  def user_articles
    @articles = Article.where(user:current_user).order("created_at DESC")
    render :index
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
    auteur = @article.user
    # Empêcher un utilisateur de modifier un article qui ne lui appartient pas
    if auteur != current_user
      redirect_to @article, notice: 'Cet article ne vous appartient pas'
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    auteur = @article.user

    # Empêcher un utilisateur de supprimer un article qui ne lui appartient pas
    if auteur != current_user
      @article.destroy
      respond_with(@article)
    else
      redirect_to @article, notice: 'Cet article ne vous appartient pas'
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:titre, :contenu, :auteur)
    end

    # Fonction créée pour répondre au JSON et au XML
    def respond_format(item)
      respond_to do |format|
        format.html
        format.json {render :json => item}
        format.xml {render :xml => item}
      end
    end
end
