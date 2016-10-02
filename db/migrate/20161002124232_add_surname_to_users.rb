class AddSurnameToUsers < ActiveRecord::Migration
  def change
      add_column :users, :is_male, :boolean, default: false
      add_column :users, :surname, :string
  end
end
