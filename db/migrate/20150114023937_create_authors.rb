class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :username
      t.string :password
      t.string :email

      t.timestamps null: false
    end
  end
end
