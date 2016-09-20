class Commentaire < ActiveRecord::Base
  # Definitions des relations pour les commentaires. Chaque commentaire appartient à un utilisateurs et appartient aussi à un article
  belongs_to :article
  belongs_to :user

  # valider la présence du contenu pour ne pas poster d'articles vides
  validates_presence_of :contenu
end