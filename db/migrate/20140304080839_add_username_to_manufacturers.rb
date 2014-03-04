class AddUsernameToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :username, :string
  end
end
