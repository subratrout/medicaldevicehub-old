class AddTitleAndBodyToVideourls < ActiveRecord::Migration
  def change
    add_column :videourls, :title, :string
    add_column :videourls, :body, :string
  end
end
