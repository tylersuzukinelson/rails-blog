class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.integer :author
      t.integer :vote_count
      t.integer :view_count

      t.timestamps null: false
    end
  end
end
