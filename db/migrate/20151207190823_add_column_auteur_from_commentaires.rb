class AddColumnAuteurFromCommentaires < ActiveRecord::Migration
  def change
    add_reference :commentaires, :user, index: true
  end
end
