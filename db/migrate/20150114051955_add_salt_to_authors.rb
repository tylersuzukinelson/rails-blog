class AddSaltToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :salt, :string
  end
end
