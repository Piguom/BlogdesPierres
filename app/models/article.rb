class Article < ActiveRecord::Base
	# Définition des relations, un article appartient à un utilisateur et a plusieurs commentaires
	belongs_to :user
	has_many :commentaires

	# Un article doit avoir un titre et un contenu
	validates :titre, :contenu, presence: true
end