class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :nested
      t.integer :parent
      t.string :author
      t.string :email
      t.text :body

      t.timestamps null: false
    end
  end
end
