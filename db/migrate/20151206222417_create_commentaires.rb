class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.text :contenu
      t.references :article, index: true

      t.timestamps
    end
  end
end
