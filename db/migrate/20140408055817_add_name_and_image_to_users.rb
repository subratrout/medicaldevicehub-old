class AddNameAndImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string

    add_index :users, :name
    add_index :users, :image
  end
end
