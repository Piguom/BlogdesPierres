class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  # Définition des relationships, un utilisateur a plusieurs commentaires et a plusieurs articles
  has_many :articles
  has_many :commentaires
end
